main {
  var pname = "computer";
  var src = new IloOplModelSource(pname+".mod");
  var def = new IloOplModelDefinition(src);
  var cplex = new IloCplex();
  var model = new IloOplModel(def,cplex);
  var data = new IloOplDataSource(pname+".dat");
  model.addDataSource(data);
  model.generate();

  // https://www.ibm.com/support/knowledgecenter/SSSA5P_12.8.0/ilog.odms.cplex.help/CPLEX/Parameters/topics/EpGap.html
  cplex.epgap=0.01;

  if (cplex.solve()) {
    writeln("Max load " + cplex.getObjValue() + "%");

    for (var c=1;c<=model.nCPUs;c++) {
      var load=0;
      for (var t=1;t<=model.nTasks;t++) {
        load += (model.r_t[t]*model.x_tc[t][c]);
      }
      load = (1/model.r_c[c])*load;
      writeln("CPU " + c + " loaded at " + load + "%");
    }
  }
  else {
    writeln("Not solution found");
  }

  data.end();
  model.end();
  cplex.end();
  def.end();
  src.end();
};
