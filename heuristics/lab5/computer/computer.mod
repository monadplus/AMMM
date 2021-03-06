int nTasks = ...;
int nCPUs = ...;

range Tasks = 1..nTasks;
range CPUs  = 1..nCPUs;

float rt[Tasks] = ...;
float rc[CPUs]  = ...;

// Percentage of resources requested by task t that are served to computer c.
dvar float+ x_tc[Tasks][CPUs];

dvar float+ z;

execute {
  var totalLoad = 0;
  var cpuCapacity = 0;

  for (var t=1;t<=nTasks;t++)
    totalLoad += rt[t];
  for (var c=1;c<=nCPUs;c++)
    cpuCapacity += rc[c];

  var can_process = "Yes";
  if (totalLoad > cpuCapacity) can_process = "No";

  writeln("Total load " + totalLoad);
  writeln("Total capacity " + cpuCapacity);
  writeln("Can request load be processed? " + can_process);
}

minimize z;

subject to {

  forall(c in CPUs)
    (1/rc[c]) * (sum(t in Tasks) rt[t] * x_tc[t][c]) <= z;

  forall(t in Tasks)
    sum(c in CPUs) x_tc[t][c] == 1;

  forall(c in CPUs)
    sum(t in Tasks) x_tc[t][c] * rt[t] <= rc[c];
}

execute {
  for (var c=1; c<=nCPUs;c++) {
    var load=0;
    for (var t=1;t<=nTasks;t++)
      load+=(r_t[t]*x_tc[t][c]);
    load = (1/rc[c])*load;
    writeln("CPU " + c + " loaded at " + load + "%");
  }
};
