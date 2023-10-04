model BuckVoltage
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch s1 annotation(
    Placement(visible = true, transformation(origin = {-16, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode d1 annotation(
    Placement(visible = true, transformation(origin = {-16, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Inductor L(L(displayUnit = "uH") = 0.0002) annotation(
    Placement(visible = true, transformation(origin = {8, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C(C(displayUnit = "uF") = 0.0004) annotation(
    Placement(visible = true, transformation(origin = {32, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor Rload1(R = 5) annotation(
    Placement(visible = true, transformation(origin = {52, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor rc(R = 0.1) annotation(
    Placement(visible = true, transformation(origin = {32, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage Vin(V = 30) annotation(
    Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {32, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period(displayUnit = "us") = 1e-05) annotation(
    Placement(visible = true, transformation(origin = {-51, 5}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.SawTooth sawTooth(amplitude = 0.5, period(displayUnit = "us") = 1e-05) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Logical.Greater greater annotation(
    Placement(visible = true, transformation(origin = {58, 35}, extent = {{-6, -7}, {6, 7}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction tf(a = {1.4678141528871698e-10, 2.42306760358614e-05, 1, 0}, b = {5.155046782399567e-05, 1.2322623828647925, 7364}) annotation(
    Placement(visible = true, transformation(origin = {-2, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-34, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = Rload1.v) annotation(
    Placement(visible = true, transformation(origin = {-77, 43}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant vref(k = 15) annotation(
    Placement(visible = true, transformation(origin = {-75, 59}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(Rload1.n, C.n) annotation(
    Line(points = {{52, -42}, {52, -56}, {32, -56}}, color = {0, 0, 255}));
  connect(C.n, d1.p) annotation(
    Line(points = {{32, -56}, {-16, -56}, {-16, -28}}, color = {0, 0, 255}));
  connect(d1.n, s1.p) annotation(
    Line(points = {{-16, -8}, {-16, 2}}, color = {0, 0, 255}));
  connect(L.p, d1.n) annotation(
    Line(points = {{-2, -6}, {-16, -6}, {-16, -8}}, color = {0, 0, 255}));
  connect(L.n, rc.p) annotation(
    Line(points = {{18, -6}, {32, -6}, {32, -10}}, color = {0, 0, 255}));
  connect(rc.n, C.p) annotation(
    Line(points = {{32, -30}, {32, -36}}, color = {0, 0, 255}));
  connect(Rload1.p, rc.p) annotation(
    Line(points = {{52, -22}, {52, -10}, {32, -10}}, color = {0, 0, 255}));
  connect(s1.n, Vin.p) annotation(
    Line(points = {{-16, 22}, {-72, 22}, {-72, -12}}, color = {0, 0, 255}));
  connect(Vin.n, C.n) annotation(
    Line(points = {{-72, -32}, {-72, -56}, {32, -56}}, color = {0, 0, 255}));
  connect(ground.p, C.n) annotation(
    Line(points = {{32, -60}, {32, -56}}, color = {0, 0, 255}));
  connect(add.y, tf.u) annotation(
    Line(points = {{-28, 46}, {-10, 46}}, color = {0, 0, 127}));
  connect(tf.y, greater.u1) annotation(
    Line(points = {{4, 46}, {42, 46}, {42, 36}, {50, 36}}, color = {0, 0, 127}));
  connect(sawTooth.y, greater.u2) annotation(
    Line(points = {{36, 30}, {50, 30}}, color = {0, 0, 127}));
  connect(realExpression.y, add.u2) annotation(
    Line(points = {{-67, 43}, {-42, 43}, {-42, 42}}, color = {0, 0, 127}));
  connect(vref.y, add.u1) annotation(
    Line(points = {{-70, 60}, {-50, 60}, {-50, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(greater.y, s1.control) annotation(
    Line(points = {{64, 36}, {78, 36}, {78, 18}, {-6, 18}, {-6, 34}, {-36, 34}, {-36, 12}, {-28, 12}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end BuckVoltage;