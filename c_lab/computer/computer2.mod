int nTasks = ...;
int nThreads = ...;
int nCPUs = ...;
int nCores = ...;

range Tasks  = 1..nTasks;
range Threads = 1..nThreads;
range CPUs  = 1..nCPUs;
range Cores  = 1..nCores;

float rh[Threads] = ...;
// A core has the same capacity as the computer it belongs.
float rc[CPUs]  = ...;

tuple Pair {
  int start;
  int end;
  int n;
}

// Cores belonging to each computer
int CK[CPUs][Cores] = ...;
// Threads belonging to each task
int TH[Tasks][Threads] = ...;

// Number of threads of each task
Pair th[Tasks];

// Number of cores in each computer
Pair ck[CPUs];

dvar boolean x_tc[Tasks][CPUs]; // If task t is served from computer c
dvar boolean x_hk[Threads][Cores]; // Thread h is served from core k

dvar float+ z;

dvar boolean u_c[CPUs]; // CPU c is unused

execute {
  for (var c = 1; c <= nCPUs; c++) {
    var start;
    var end;
    for (var k = 1; k <= nCores; k++) {
      if (CK[c][k]) {
        if (!start) start = k;
        end = k;
      }
    }
    ck[c].start = start;
    ck[c].end = end;
    ck[c].n = end - start + 1;
  }

  for (var t = 1; t <= nTasks; t++) {
    var started = false;
    var start = 0;
    var end = 0;
    for (var h = 1; h <= nThreads; h++) {
      if (TH[t][h]) {
        if (!start) start = h;
        end = h;
      }
    }
    th[t].start = start;
    th[t].end = end;
    th[t].n = end - start + 1;
  }
}

minimize z + sum(c in CPUs) (1 - u_c[c]);

subject to {  
  // (2) Each thread is assigned to one core.
  forall(h in Threads)
    sum(k in Cores) x_hk[h][k] == 1;

  // (3) Number of threads assigned to computer c
  // is equal to the number of threads of the task.
  forall(t in Tasks)
    forall(c in CPUs)
      sum(h in th[t].start..th[t].end) 
        sum(k in ck[c].start..ck[c].end) 
          x_hk[h][k] == th[t].n*x_tc[t][c];

   // (4) The sum of resources of all threads assigneds to the core
   // should be smaller than the resources of the core.
  forall(c in CPUs)
    forall(k in ck[c].start..ck[c].end)
      sum(h in Threads) rh[h] * x_hk[h][k] <= rc[c];

  // (5) Load average
  forall(c in CPUs)
     z >= ((1/ck[c].n*rc[c])
            * sum(h in Threads) 
                sum(k in ck[c].start..ck[c].end) 
                  rh[h] * x_hk[h][k]);

  // (6) When none of the tasks is assigned to CPU c, u_c[c] "unused cp" must me 1.
 
  // u_c = 1 ===> x_tc[1] +...+ x_tc[nTasks] <= 0
  forall(c in CPUs)
    sum(t in Tasks) x_tc[t][c] <= (nTasks*(1 - u_c[c]));

  // x_tc[1] +...+ x_tc[nTasks] <= 0 ===> u_c = 1
  forall(c in CPUs)
    sum(t in Tasks) x_tc[t][c] >= (-u_c[c] + 1);

}
