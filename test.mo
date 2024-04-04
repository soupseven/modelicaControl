package test
  model model1
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor air(C = 1004.6*100, T(start = 295.15)) annotation(
      Placement(visible = true, transformation(origin = {20, 61}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
      Placement(visible = true, transformation(origin = {-18, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 10) annotation(
      Placement(visible = true, transformation(origin = {-60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
      Placement(visible = true, transformation(origin = {-104, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
      Placement(visible = true, transformation(origin = {-148, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow = 3000) annotation(
      Placement(visible = true, transformation(origin = {-6, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 10) annotation(
      Placement(visible = true, transformation(origin = {-128, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Sine sine(amplitude = 10, f = 20, offset = 30 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant1(k = 10000) annotation(
      Placement(visible = true, transformation(origin = {172, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.FluidHeatFlow.Sources.Ambient waterIn(constantAmbientPressure = 99999.99999999999, constantAmbientTemperature = 293.15) annotation(
      Placement(visible = true, transformation(origin = {144, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.FluidHeatFlow.Sources.Ambient waterOut(constantAmbientPressure = 99999.99999999999, constantAmbientTemperature = 293.15) annotation(
      Placement(visible = true, transformation(origin = {4, -86}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.FluidHeatFlow.Components.Pipe pipe(T0 = 293.15, V_flowLaminar = 0.1, V_flowNominal = 10, dpLaminar = 10000, dpNominal = 1100000, h_g = 0, m = 0.1, useHeatPort = true) annotation(
      Placement(visible = true, transformation(origin = {86, -64}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow(T0 = 293.15, V_flow(start = 10), constantVolumeFlow = 10, m = 0.1, useVolumeFlowInput = true) annotation(
      Placement(visible = true, transformation(origin = {46, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
      Placement(visible = true, transformation(origin = {124, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
      Placement(visible = true, transformation(origin = {58, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID pid(k = 100,yMax = 1500, yMin = 100)  annotation(
      Placement(visible = true, transformation(origin = {-40, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 273.15 + 23) annotation(
      Placement(visible = true, transformation(origin = {-96, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(prescribedTemperature.port, convection1.solid) annotation(
      Line(points = {{-138, 32}, {-127, 32}, {-127, 30}, {-114, 30}}, color = {191, 0, 0}));
    connect(fixedHeatFlow.port, air.port) annotation(
      Line(points = {{4, -6}, {22, -6}, {22, 46}}, color = {191, 0, 0}));
    connect(const.y, convection1.Gc) annotation(
      Line(points = {{-117, 76}, {-104, 76}, {-104, 40}}, color = {0, 0, 127}));
    connect(const.y, convection.Gc) annotation(
      Line(points = {{-117, 76}, {-18, 76}, {-18, 42}}, color = {0, 0, 127}));
    connect(sine.y, prescribedTemperature.T) annotation(
      Line(points = {{-158, -30}, {-140, -30}, {-140, 12}, {-168, 12}, {-168, 32}, {-160, 32}}, color = {0, 0, 127}));
    connect(convection.fluid, air.port) annotation(
      Line(points = {{-8, 32}, {6, 32}, {6, 46}, {20, 46}}, color = {191, 0, 0}));
    connect(convection1.fluid, thermalConductor.port_a) annotation(
      Line(points = {{-94, 30}, {-82, 30}, {-82, 22}, {-70, 22}}, color = {191, 0, 0}));
    connect(thermalConductor.port_b, convection.solid) annotation(
      Line(points = {{-50, 22}, {-41, 22}, {-41, 32}, {-28, 32}}, color = {191, 0, 0}));
    connect(waterIn.flowPort, pipe.flowPort_a) annotation(
      Line(points = {{134, -54}, {96, -54}, {96, -64}}, color = {255, 0, 0}));
    connect(pipe.flowPort_b, volumeFlow.flowPort_a) annotation(
      Line(points = {{76, -64}, {56, -64}, {56, -58}}, color = {255, 0, 0}));
    connect(volumeFlow.flowPort_b, waterOut.flowPort) annotation(
      Line(points = {{36, -58}, {20, -58}, {20, -86}, {14, -86}}, color = {255, 0, 0}));
    connect(pipe.heatPort, convection3.solid) annotation(
      Line(points = {{86, -74}, {106, -74}, {106, -70}, {108, -70}, {108, -34}, {100, -34}, {100, -14}, {114, -14}}, color = {191, 0, 0}));
    connect(convection3.fluid, air.port) annotation(
      Line(points = {{134, -14}, {134, 46}, {20, 46}}, color = {191, 0, 0}));
    connect(constant1.y, convection3.Gc) annotation(
      Line(points = {{183, 28}, {124, 28}, {124, -4}}, color = {0, 0, 127}));
    connect(temperatureSensor.port, air.port) annotation(
      Line(points = {{48, 68}, {42, 68}, {42, 46}, {20, 46}}, color = {191, 0, 0}));
    connect(pid.y, volumeFlow.volumeFlow) annotation(
      Line(points = {{-29, -44}, {0.5, -44}, {0.5, -50}, {46, -50}}, color = {0, 0, 127}));
    connect(constant3.y, pid.u_m) annotation(
      Line(points = {{-84, -52}, {-64, -52}, {-64, -56}, {-40, -56}}, color = {0, 0, 127}));
    connect(temperatureSensor.T, pid.u_s) annotation(
      Line(points = {{70, 68}, {92, 68}, {92, -18}, {-52, -18}, {-52, -44}}, color = {0, 0, 127}));
  end model1;

  model house
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
      Placement(visible = true, transformation(origin = {46, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor air(C = 1004.6*100, T(start = 295.15)) annotation(
      Placement(visible = true, transformation(origin = {86, 35}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
      Placement(visible = true, transformation(origin = {-80, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
      Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 10) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow = 3000) annotation(
      Placement(visible = true, transformation(origin = {56, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput GC annotation(
      Placement(visible = true, transformation(origin = {-120, 46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Tamb annotation(
      Placement(visible = true, transformation(origin = {-124, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
      Placement(visible = true, transformation(origin = {132, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fixedHeatFlow.port, air.port) annotation(
      Line(points = {{66, -42}, {86, -42}, {86, 20}}, color = {191, 0, 0}));
  connect(convection.fluid, air.port) annotation(
      Line(points = {{56, -2}, {86, -2}, {86, 20}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, convection.solid) annotation(
      Line(points = {{10, 0}, {22, 0}, {22, -2}, {36, -2}}, color = {191, 0, 0}));
  connect(convection1.fluid, thermalConductor.port_a) annotation(
      Line(points = {{-24, 0}, {-10, 0}}, color = {191, 0, 0}));
  connect(prescribedTemperature.port, convection1.solid) annotation(
      Line(points = {{-70, -2}, {-59, -2}, {-59, 0}, {-44, 0}}, color = {191, 0, 0}));
  connect(GC, convection1.Gc) annotation(
      Line(points = {{-120, 46}, {-34, 46}, {-34, 10}}, color = {0, 0, 127}));
  connect(GC, convection.Gc) annotation(
      Line(points = {{-120, 46}, {46, 46}, {46, 8}}, color = {0, 0, 127}));
  connect(Tamb, prescribedTemperature.T) annotation(
      Line(points = {{-124, -10}, {-92, -10}, {-92, -2}}, color = {0, 0, 127}));
  connect(air.port, port_a) annotation(
      Line(points = {{86, 20}, {132, 20}, {132, -54}}, color = {191, 0, 0}));
  annotation(
      Icon(graphics = {Rectangle(origin = {0, 4}, extent = {{-100, 74}, {100, -74}}), Line(origin = {5.30853, 77.8262}, points = {{-105.308, 0.1738}, {-105.309, 0.173762}, {-5.30853, 22.1738}, {94.6915, 0.173762}, {94.6915, 0.173762}})}));
end house;

  model cool
  Modelica.Thermal.FluidHeatFlow.Sources.VolumeFlow volumeFlow(T0 = 293.15, V_flow(start = 10), constantVolumeFlow = 10, m = 0.1, useVolumeFlowInput = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Components.Pipe pipe(T0 = 293.15, V_flowLaminar = 0.1, V_flowNominal = 10, dpLaminar = 10000, dpNominal = 1100000, h_g = 0, m = 0.1, useHeatPort = true) annotation(
      Placement(visible = true, transformation(origin = {34, -8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient waterOut(constantAmbientPressure = 99999.99999999999, constantAmbientTemperature = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-50, -36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient waterIn(constantAmbientPressure = 99999.99999999999, constantAmbientTemperature = 293.15) annotation(
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection3 annotation(
      Placement(visible = true, transformation(origin = {70, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
      Placement(visible = true, transformation(origin = {-100, 18}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 54}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput GC annotation(
      Placement(visible = true, transformation(origin = {-102, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-122, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(
      Placement(visible = true, transformation(origin = {146, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pipe.heatPort, convection3.solid) annotation(
      Line(points = {{34, -18}, {54, -18}, {54, 16}, {46, 16}, {46, 36}, {60, 36}}, color = {191, 0, 0}));
    connect(pipe.flowPort_b, volumeFlow.flowPort_a) annotation(
      Line(points = {{24, -8}, {13, -8}, {13, -10}, {2, -10}}, color = {255, 0, 0}));
    connect(volumeFlow.flowPort_b, waterOut.flowPort) annotation(
      Line(points = {{-18, -10}, {-34, -10}, {-34, -38}, {-40, -38}}, color = {255, 0, 0}));
  connect(waterIn.flowPort, pipe.flowPort_a) annotation(
      Line(points = {{92, -4}, {68, -4}, {68, -8}, {44, -8}}, color = {255, 0, 0}));
  connect(u, volumeFlow.volumeFlow) annotation(
      Line(points = {{-100, 18}, {-8, 18}, {-8, 0}}, color = {0, 0, 127}));
  connect(GC, convection3.Gc) annotation(
      Line(points = {{-102, 60}, {70, 60}, {70, 46}}, color = {0, 0, 127}));
  connect(convection3.fluid, port_b) annotation(
      Line(points = {{80, 36}, {124, 36}, {124, 44}, {146, 44}}, color = {191, 0, 0}));
  annotation(
      Icon(graphics = {Rectangle(origin = {0, 16}, extent = {{-100, 58}, {100, -58}})}));
end cool;

  model SYSTEM
  test.house house annotation(
      Placement(visible = true, transformation(origin = {-28, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  test.cool cool annotation(
      Placement(visible = true, transformation(origin = {-16, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10) annotation(
      Placement(visible = true, transformation(origin = {-128, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 10, f = 20, offset = 30 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-114, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 273.15 + 23) annotation(
      Placement(visible = true, transformation(origin = {-96, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 10000) annotation(
      Placement(visible = true, transformation(origin = {-60, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID pid(k = 100, yMax = 1500, yMin = 100) annotation(
      Placement(visible = true, transformation(origin = {-54, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
      Placement(visible = true, transformation(origin = {66, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(cool.port_b, house.port_a) annotation(
      Line(points = {{-5, -37}, {38, -37}, {38, 28}, {-17, 28}}, color = {191, 0, 0}));
  connect(const.y, house.GC) annotation(
      Line(points = {{-116, 76}, {-40, 76}, {-40, 34}}, color = {0, 0, 127}));
  connect(sine.y, house.Tamb) annotation(
      Line(points = {{-102, 4}, {-40, 4}, {-40, 23}}, color = {0, 0, 127}));
  connect(constant1.y, cool.GC) annotation(
      Line(points = {{-49, -80}, {-28, -80}, {-28, -39}}, color = {0, 0, 127}));
  connect(pid.y, cool.u) annotation(
      Line(points = {{-43, -40}, {-34.5, -40}, {-34.5, -33}, {-28, -33}}, color = {0, 0, 127}));
  connect(temperatureSensor.port, house.port_a) annotation(
      Line(points = {{56, 60}, {-17, 60}, {-17, 28}}, color = {191, 0, 0}));
  connect(constant3.y, pid.u_m) annotation(
      Line(points = {{-84, -52}, {-54, -52}}, color = {0, 0, 127}));
  connect(temperatureSensor.T, pid.u_s) annotation(
      Line(points = {{78, 60}, {92, 60}, {92, -10}, {-66, -10}, {-66, -40}}, color = {0, 0, 127}));
  annotation(
      Diagram);
end SYSTEM;
  
  model SYSTEM2
  test.house house annotation(
      Placement(visible = true, transformation(origin = {-28, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  test.cool cool annotation(
      Placement(visible = true, transformation(origin = {-2, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 10) annotation(
      Placement(visible = true, transformation(origin = {-128, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 10, f = 20, offset = 30 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-170, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 273.15 + 25) annotation(
      Placement(visible = true, transformation(origin = {-184, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 10000) annotation(
      Placement(visible = true, transformation(origin = {-60, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
      Placement(visible = true, transformation(origin = {66, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.StepWithSignal stepWithSignal(nIn = 1, nOut = 1)  annotation(
      Placement(visible = true, transformation(origin = {-84, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep initialStep(nOut = 1, nIn = 1)  annotation(
      Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue = 1500)  annotation(
      Placement(visible = true, transformation(origin = {-30, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal(waitTime = 10)  annotation(
      Placement(visible = true, transformation(origin = {-114, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal1(waitTime = 10)  annotation(
      Placement(visible = true, transformation(origin = {-50, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Greater greater annotation(
      Placement(visible = true, transformation(origin = {-150, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Less less annotation(
      Placement(visible = true, transformation(origin = {-90, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k = 273.15 + 23) annotation(
      Placement(visible = true, transformation(origin = {-130, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
      Placement(visible = true, transformation(origin = {136, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(cool.port_b, house.port_a) annotation(
      Line(points = {{9, -57}, {38, -57}, {38, 28}, {-17, 28}}, color = {191, 0, 0}));
    connect(const.y, house.GC) annotation(
      Line(points = {{-116, 76}, {-40, 76}, {-40, 34}}, color = {0, 0, 127}));
    connect(sine.y, house.Tamb) annotation(
      Line(points = {{-159, 48}, {-40, 48}, {-40, 23}}, color = {0, 0, 127}));
    connect(constant1.y, cool.GC) annotation(
      Line(points = {{-49, -80}, {-14, -80}, {-14, -59}}, color = {0, 0, 127}));
    connect(temperatureSensor.port, house.port_a) annotation(
      Line(points = {{56, 60}, {-17, 60}, {-17, 28}}, color = {191, 0, 0}));
  connect(booleanToReal.y, cool.u) annotation(
      Line(points = {{-19, -54}, {-16.5, -54}, {-16.5, -52}, {-14, -52}}, color = {0, 0, 127}));
  connect(stepWithSignal.active, booleanToReal.u) annotation(
      Line(points = {{-84, -25}, {-42, -25}, {-42, -54}}, color = {255, 0, 255}));
  connect(initialStep.outPort[1], transitionWithSignal.inPort) annotation(
      Line(points = {{-129.5, -10}, {-118, -10}, {-118, -4}}));
  connect(transitionWithSignal.outPort, stepWithSignal.inPort[1]) annotation(
      Line(points = {{-112, -4}, {-98, -4}, {-98, -14}, {-94, -14}}));
  connect(stepWithSignal.outPort[1], transitionWithSignal1.inPort) annotation(
      Line(points = {{-74, -14}, {-58, -14}, {-58, -2}, {-54, -2}}));
  connect(transitionWithSignal1.outPort, initialStep.inPort[1]) annotation(
      Line(points = {{-48.5, -2}, {-26, -2}, {-26, 16}, {-164, 16}, {-164, -10}, {-151, -10}}));
  connect(temperatureSensor.T, greater.u1) annotation(
      Line(points = {{78, 60}, {96, 60}, {96, -34}, {-180, -34}, {-180, -52}, {-162, -52}}, color = {0, 0, 127}));
  connect(greater.y, transitionWithSignal.condition) annotation(
      Line(points = {{-138, -52}, {-114, -52}, {-114, -16}}, color = {255, 0, 255}));
  connect(constant3.y, greater.u2) annotation(
      Line(points = {{-173, -82}, {-162, -82}, {-162, -60}}, color = {0, 0, 127}));
  connect(temperatureSensor.T, less.u1) annotation(
      Line(points = {{78, 60}, {68, 60}, {68, -34}, {-102, -34}, {-102, -56}}, color = {0, 0, 127}));
  connect(constant2.y, less.u2) annotation(
      Line(points = {{-118, -88}, {-102, -88}, {-102, -64}}, color = {0, 0, 127}));
  connect(less.y, transitionWithSignal1.condition) annotation(
      Line(points = {{-78, -56}, {-50, -56}, {-50, -14}}, color = {255, 0, 255}));
    annotation(
      Diagram);
  end SYSTEM2;
  annotation(
    uses(Modelica(version = "4.0.0")));
end test;
