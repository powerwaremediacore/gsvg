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
      var r = svg.create_rect (null, null, null, null, null, null);
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
      var r = svg.create_rect ("0cm", "1cm",
                    "1.5cm", "1.5cm",
                    "0.1cm", "0.1cm");
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
      assert ("%.2f".printf (r.rx.base_val.value) == "%.2f".printf (0.1));
      assert (r.rx.base_val.unit_type == Length.Type.CM);
      assert ("%.2f".printf (r.ry.base_val.value) == "%.2f".printf (0.1));
      assert (r.ry.base_val.unit_type == Length.Type.CM);
    });
    Test.add_func ("/gsvg/circle-element/construct/initialize",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
      var c = svg.create_circle ("1mm", "1mm", "3.5mm");
      svg.append_child (c);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"><circle cx=\"1mm\" cy=\"1mm\" r=\"3.5mm\"/></svg>" in s);
      assert ("%.2f".printf (c.cx.base_val.value) == "%.2f".printf (1.0));
      assert (c.cx.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (c.cy.base_val.value) == "%.2f".printf (1.0));
      assert (c.cy.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (c.r.base_val.value) == "%.2f".printf (3.5));
      assert (c.r.base_val.unit_type == Length.Type.MM);
    });
    Test.add_func ("/gsvg/ellipse-element/construct/initialize",
    ()=>{
      try {
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
      var c = new GSvg.GsEllipseElement.initialize (svg, "1mm", "1mm", "3.5mm", "3.5mm");
      svg.append_child (c);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"><ellipse cx=\"1mm\" cy=\"1mm\" rx=\"3.5mm\" ry=\"3.5mm\"/></svg>" in s);
      assert (c.cx.base_val.value == (float) 1.0);
      assert (c.cx.base_val.unit_type == Length.Type.MM);
      assert (c.cy.base_val.value == (float) 1.0);
      assert (c.cy.base_val.unit_type == Length.Type.MM);
      assert (c.rx.base_val.value == (float) 3.5);
      assert (c.rx.base_val.unit_type == Length.Type.MM);
      assert (c.ry.base_val.value == (float) 3.5);
      assert (c.ry.base_val.unit_type == Length.Type.MM);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
      //assert_not_reached ();
    });
    Test.add_func ("/gsvg/polyline-element/construct/initialize",
    ()=>{
      /*try {
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
      var c = new GSvg.GsEllipseElement.initialize (svg, "1mm", "1mm", "3.5mm", "3.5mm");
      svg.append_child (c);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"><ellipse cx=\"1mm\" cy=\"1mm\" rx=\"3.5mm\" ry=\"3.5mm\"/></svg>" in s);
      assert (c.cx.base_val.value == (float) 1.0);
      assert (c.cx.base_val.unit_type == Length.Type.MM);
      assert (c.cy.base_val.value == (float) 1.0);
      assert (c.cy.base_val.unit_type == Length.Type.MM);
      assert (c.rx.base_val.value == (float) 3.5);
      assert (c.rx.base_val.unit_type == Length.Type.MM);
      assert (c.ry.base_val.value == (float) 3.5);
      assert (c.ry.base_val.unit_type == Length.Type.MM);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
      //assert_not_reached ();*/
    });
  }
}
