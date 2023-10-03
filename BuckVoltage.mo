model BuckVoltage
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch s1 annotation(
    Placement(visible = true, transformation(origin = {-16, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Ideal.IdealDiode d1 annotation(
    Placement(visible = true, transformation(origin = {-16, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Basic.Inductor L(L(displayUnit = "uH") = 0.0002)  annotation(
    Placement(visible = true, transformation(origin = {8, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C(C(displayUnit = "uF") = 0.0004)  annotation(
    Placement(visible = true, transformation(origin = {32, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor Rload1(R = 5)  annotation(
    Placement(visible = true, transformation(origin = {52, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor rc(R = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {32, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage Vin annotation(
    Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {32, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period(displayUnit = "us") = 1e-05)  annotation(
    Placement(visible = true, transformation(origin = {-51, 5}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
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
  connect(booleanPulse.y, s1.control) annotation(
    Line(points = {{-43, 5}, {-28, 5}, {-28, 12}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end BuckVoltage;