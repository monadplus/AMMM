main {

  var files = new Array();
  files[0] = "test.dat";
  files[1] = "small_0.dat";
  files[2] = "mid_0.dat";
  files[3] = "big_0.dat";

  var pname = "computer2";
  var src = new IloOplModelSource(pname+".mod");
  var def = new IloOplModelDefinition(src);
  var cplex = new IloCplex();

  // https://www.ibm.com/support/knowledgecenter/SSSA5P_12.8.0/ilog.odms.cplex.help/CPLEX/Parameters/topics/EpGap.html
  cplex.epgap=0.01;

  for (var i = 0; i <= 3; ++i) {

    writeln("Problem: " + files[i]);

    var model = new IloOplModel(def,cplex);
    var data = new IloOplDataSource(files[i]);

    model.addDataSource(data);
    model.generate();

    if (cplex.solve()) {
      writeln(cplex.getObjValue());

       writeln("Task - Computer");
       for (var t=1; t <= model.nTasks; t++) {
         write("[");
         for (var c=1; c <= model.nCPUs; c++) {
           write(model.x_tc[t][c] + ",");
         }
         writeln("]");
       }

       writeln("Thread - Core");
       for (var h=1; h <= model.nThreads; h++) {
         write("[");
         for (var k=1; k <= model.nCores; k++) {
           write(model.x_hk[h][k] + ",");
         }
         writeln("]");
       }

      for (var c=1; c <= model.nCPUs; c++) {
        var load=0;
        for (var h=1; h <= model.nThreads; h++) {
          for (var k=model.ck[c].start; k <= model.ck[c].end; k++) {
            load += (model.rh[h]*model.x_hk[h][k]);
          }
        }
        load = (1/(model.ck[c].n*model.rc[c]))*load;
        writeln("CPU " + c + " loaded at " + load + "%");
      }
    }
    else {
      writeln("Not solution found");
    }

    data.end();
    model.end();
  }

  cplex.end();
  def.end();
  src.end();
};
