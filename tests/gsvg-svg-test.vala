/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * pwmui-object-editor.vala
 * Copyright (C) 2015 Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 */

using GSvg;
using GXml;

public class GSvgTest.SvgTest {
  public static void add_funcs ()
  {
    Test.add_func ("/gsvg/svg/construct/default",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
    });
    Test.add_func ("/gsvg/rect-element/construct/default",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
      var r = new GSvg.GsRectElement.initialize (svg, null, null, null, null, null, null);
      svg.append_child (r);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"><rect/></svg>" in s);
    });
    Test.add_func ("/gsvg/rect-element/construct/initialize",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
      var r = new GSvg.GsRectElement.initialize (svg, "0cm", "1cm",
                                                "1.5cm", "1.5cm",
                                                ".1cm", ".1cm");
      svg.append_child (r);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"><rect x=\"0cm\" y=\"1cm\" width=\"1.5cm\" height=\"1.5cm\" rx=\"0.1cm\" ry=\"0.1cm\"/></svg>" in s);
      assert (r.x.base_val.value == (float) 0.0);
      assert (r.x.base_val.unit_type == Length.Type.CM);
      assert (r.y.base_val.value == (float) 1.0);
      assert (r.y.base_val.unit_type == Length.Type.CM);
      assert (r.width.base_val.value == (float) 1.5);
      assert (r.width.base_val.unit_type == Length.Type.CM);
      assert (r.height.base_val.value == (float) 1.5);
      assert (r.height.base_val.unit_type == Length.Type.CM);
      assert (r.rx.base_val.value == (float) 0.1);
      assert (r.rx.base_val.unit_type == Length.Type.CM);
      assert (r.ry.base_val.value == (float) 0.1);
      assert (r.ry.base_val.unit_type == Length.Type.CM);
    });
  }
}
