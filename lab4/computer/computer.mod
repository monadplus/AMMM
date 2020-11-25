int nTasks = ...;
int nCPUs = ...;

range Tasks = 1..nTasks;
range CPUs  = 1..nCPUs;

float r_t[Tasks] = ...;
float r_c[CPUs]  = ...;

// Percentage of resources requested by task t that are served to computer c.
dvar float+ x_tc[Tasks][CPUs];

dvar float+ z;

execute {
  var totalLoad = 0;
  var cpuCapacity = 0;

  for (var t=1;t<=nTasks;t++)
    totalLoad += r_t[t];
  for (var c=1;c<=nCPUs;c++)
    cpuCapacity += r_c[c];

  var can_process = "Yes";
  if (totalLoad > cpuCapacity) can_process = "No";

  writeln("Total load " + totalLoad);
  writeln("Total capacity " + cpuCapacity);
  writeln("Can request load be processed? " + can_process);
}

minimize z;

subject to {

  forall(c in CPUs)
    (1/r_c[c]) * (sum(t in Tasks) r_t[t] * x_tc[t][c]) <= z;

  forall(t in Tasks)
    sum(c in CPUs) x_tc[t][c] == 1;

  forall(c in CPUs)
    sum(t in Tasks) x_tc[t][c] * r_t[t] <= r_c[c];
}

execute {
  for (var c=1; c<=nCPUs;c++) {
    var load=0;
    for (var t=1;t<=nTasks;t++)
      load+=(r_t[t]*x_tc[t][c]);
    load = (1/r_c[c])*load;
    writeln("CPU " + c + " loaded at " + load + "%");
  }
};
