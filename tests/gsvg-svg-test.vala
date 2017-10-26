/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * gsvg-svg-test.vala

 * Copyright (C) 2017 Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
      message ("SVG:\n"+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"/>" in s);
    });
    Test.add_func ("/gsvg/svg/construct/document",
    ()=>{
      var d = new GSvg.GsDocument ();
      d.add_svg ("0","0","20cm","15cm","0 0 20 15","SVG Title", "Description");
      message ("SVG: \n"+d.write_string ());
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"" in d.write_string ());
    });
    Test.add_func ("/gsvg/rect-element/construct/default",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"/>" in s);
      var r = svg.create_rect (null, null, null, null, null, null);
      svg.append_child (r);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><rect/></svg>" in s);
    });
    Test.add_func ("/gsvg/rect-element/construct/initialize",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"/>" in s);
      var r = svg.create_rect ("0cm", "1cm",
                    "1.5cm", "1.5cm",
                    "0.1cm", "0.1cm");
      svg.append_child (r);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><rect x=\"0cm\" y=\"1cm\" width=\"1.5cm\" height=\"1.5cm\" rx=\"0.1cm\" ry=\"0.1cm\"/></svg>" in s);
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
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"/>" in s);
      var c = svg.create_circle ("1mm", "1mm", "3.5mm");
      svg.append_child (c);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><circle cx=\"1mm\" cy=\"1mm\" r=\"3.5mm\"/></svg>" in s);
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
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"/>" in s);
      var c = svg.create_ellipse ("1mm", "1mm", "3.5mm", "3.5mm");
      svg.append_child (c);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><ellipse cx=\"1mm\" cy=\"1mm\" rx=\"3.5mm\" ry=\"3.5mm\"/></svg>" in s);
      assert ("%.2f".printf (c.cx.base_val.value) == "%.2f".printf (1.0));
      assert (c.cx.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (c.cy.base_val.value) == "%.2f".printf (1.0));
      assert (c.cy.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (c.rx.base_val.value) == "%.2f".printf (3.5));
      assert (c.rx.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (c.ry.base_val.value) == "%.2f".printf (3.5));
      assert (c.ry.base_val.unit_type == Length.Type.MM);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
    });
    Test.add_func ("/gsvg/line-element/construct/initialize",
    ()=>{
      try {
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"/>" in s);
      var l = svg.create_line  ("0mm", "0mm", "50mm", "50mm");
      svg.append_child (l);
      s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><line x1=\"0mm\" y1=\"0mm\" x2=\"50mm\" y2=\"50mm\"/></svg>" in s);
      assert ("%.2f".printf (l.x1.base_val.value) == "%.2f".printf (0.0));
      assert (l.x1.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (l.y1.base_val.value) == "%.2f".printf (0.0));
      assert (l.y1.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (l.x2.base_val.value) == "%.2f".printf (50.0));
      assert (l.x2.base_val.unit_type == Length.Type.MM);
      assert ("%.2f".printf (l.y2.base_val.value) == "%.2f".printf (50.0));
      assert (l.y2.base_val.unit_type == Length.Type.MM);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
    });
  }
}
