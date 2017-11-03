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
      try {
        var svg = new GSvg.GsSVGElement ();
        var parser = new XParser (svg);
        string s = parser.write_string ();
        assert (s != null);
        message ("SVG:\n"+s);
        assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"/>" in s);
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/svg/construct/document",
    ()=>{
      try {
        var d = new GSvg.GsDocument ();
        d.add_svg ("0","0","20cm","15cm","0 0 20 15","SVG Title", "Description");
        message ("SVG: \n"+d.write_string ());
        assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"" in d.write_string ());
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/rect-element/construct/default",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
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
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/rect-element/construct/initialize",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
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
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/circle-element/construct/initialize",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
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
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/ellipse-element/construct/initialize",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
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
        var svg = new GSvg.GsSVGElement ();
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
    Test.add_func ("/gsvg/document",
    ()=>{
      try {
        string str = """<svg xmlns="http://www.w3.org/2000/svg" width="8.5in" viewBox="0 0 8.5 11"><line x1="0mm" y1="0mm" x2="50mm" y2="50mm"/></svg>""";
        var svg = new GSvg.GsDocument () as GSvg.Document;
        svg.read_from_string (str);
        message (svg.write_string ());
        message (svg.children.item (0).get_type().name());
        message (svg.children.item (0).node_name);
        message ((svg.children.item (0) is SVGElement).to_string ());
        assert (svg.root_element != null);
        assert (svg.root_element is SVGElement);
        assert (svg.root_element.width != null);
        assert (svg.root_element.width.base_val != null);
        assert (svg.root_element.width.base_val.value == 8.5);
        assert (svg.root_element.width.base_val.unit_type == Length.Type.IN);
        assert (svg.root_element.view_box != null);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
      }
    });
    Test.add_func ("/gsvg/aspect-radio",
    ()=>{
      var aar = new GsAnimatedPreserveAspectRatio ();
      aar.value = "xMaxYMax";
      assert (aar.base_val.align == PreserveAspectRatio.Type.XMAXYMAX);
      assert (aar.base_val.meet_or_slice == PreserveAspectRatio.MeetorSlice.UNKNOWN);
      aar.value = "defer xMaxYMax";
      assert (aar.base_val.align == PreserveAspectRatio.Type.XMAXYMAX);
      assert (aar.base_val.meet_or_slice == PreserveAspectRatio.MeetorSlice.UNKNOWN);
      aar.value = "xMaxYMax meet";
      assert (aar.base_val.align == PreserveAspectRatio.Type.XMAXYMAX);
      assert (aar.base_val.meet_or_slice == PreserveAspectRatio.MeetorSlice.MEET);
      var str = """<svg preserveAspectRatio="xMaxYMax meet" />""";
      var svg = new GSvg.GsSVGElement ();
      svg.read_from_string (str);
      assert (svg.preserve_aspect_ratio != null);
      assert (svg.preserve_aspect_ratio.base_val.align == PreserveAspectRatio.Type.XMAXYMAX);
      assert (svg.preserve_aspect_ratio.base_val.meet_or_slice == PreserveAspectRatio.MeetorSlice.MEET);
      message (svg.preserve_aspect_ratio.value);
      assert (svg.preserve_aspect_ratio.value == "xMaxYMax meet");
    });
    Test.add_func ("/gsvg/container",
    ()=>{
      try {
        string str = """<svg xmlns="http://www.w3.org/2000/svg" width="8.5in" viewBox="0 0 8.5 11"><svg id="svg"><line id="line" x1="0mm" y1="0mm" x2="50mm" y2="50mm"/></svg></svg>""";
        var svg = new GSvg.GsDocument ();
        svg.read_from_string (str);
        var csvg = svg.get_element_by_id ("svg") as SVGElement;
        assert (csvg != null);
        assert (csvg is SVGElement);
        assert (csvg is GsSVGElement);
        assert (csvg.id == "svg");
        assert ((csvg as ContainerElement).lines != null);
        assert ((csvg as ContainerElement).lines.length == 1);
        assert ((csvg as ContainerElement).lines.get("line") is LineElement);
        assert (svg.root_element.svgs != null);
        assert (svg.root_element.svgs.length == 1);
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/transform/translate/parse",
    ()=>{
      var t = new GsTransform ();
      t.parse ("translate(10)");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 0.0);
      t.parse ("translate( 10)");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 0.0);
      t.parse ("translate(10 )");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 0.0);
      t.parse ("translate( 10 )");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 0.0);
      t.parse ("translate(10 20)");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 20.0);
      t.parse ("translate( 10 20)");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 20.0);
      t.parse ("translate(10 20 )");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 20.0);
      t.parse ("translate(10  20)");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 20.0);
      t.parse ("translate( 10       20 )");
      assert (t.ttype == Transform.Type.TRANSLATE);
      assert (t.matrix != null);
      assert (t.matrix.a == 1.0);
      assert (t.matrix.b == 0.0);
      assert (t.matrix.c == 0.0);
      assert (t.matrix.d == 1.0);
      assert (t.matrix.e == 10.0);
      assert (t.matrix.f == 20.0);
    });
    Test.add_func ("/gsvg/transform/list/translate",
    ()=>{
      try {
        var tl = new GsAnimatedTransformList ();
        string str = "translate(10)";
        message (str);
        tl.value = str;
        assert (tl.base_val != null);
        assert (tl.base_val.number_of_items == 1);
        var t = tl.base_val.get_item (0);
        assert (t != null);
        assert (t.ttype == Transform.Type.TRANSLATE);
        assert (t.matrix != null);
        assert (t.matrix.a == 1.0);
        assert (t.matrix.b == 0.0);
        assert (t.matrix.c == 0.0);
        assert (t.matrix.d == 1.0);
        assert (t.matrix.e == 10.0);
        assert (t.matrix.f == 0.0);
        assert (str == tl.value);
        str = "translate(11 21)";
        message (str);
        tl.value = str;
        assert (tl.base_val != null);
        assert (tl.base_val.number_of_items == 1);
        var t2 = tl.base_val.get_item (0);
        assert (t2 != null);
        assert (t2.ttype == Transform.Type.TRANSLATE);
        assert (t2.matrix != null);
        assert (t2.matrix.a == 1.0);
        assert (t2.matrix.b == 0.0);
        assert (t2.matrix.c == 0.0);
        assert (t2.matrix.d == 1.0);
        assert (t2.matrix.e == 11.0);
        assert (t2.matrix.f == 21.0);
        assert (str == tl.value);
        str = "translate(11 21) translate(20 45)";
        message (str);
        tl.value = str;
        assert (tl.base_val != null);
        assert (tl.base_val.number_of_items == 2);
        var t3 = tl.base_val.get_item (0);
        assert (t3 != null);
        assert (t3.ttype == Transform.Type.TRANSLATE);
        assert (t3.matrix != null);
        assert (t3.matrix.a == 1.0);
        assert (t3.matrix.b == 0.0);
        assert (t3.matrix.c == 0.0);
        assert (t3.matrix.d == 1.0);
        assert (t3.matrix.e == 11.0);
        assert (t3.matrix.f == 21.0);
        var t4 = tl.base_val.get_item (1);
        assert (t4 != null);
        assert (t4.ttype == Transform.Type.TRANSLATE);
        assert (t4.matrix != null);
        assert (t4.matrix.a == 1.0);
        assert (t4.matrix.b == 0.0);
        assert (t4.matrix.c == 0.0);
        assert (t4.matrix.d == 1.0);
        assert (t4.matrix.e == 20.0);
        assert (t4.matrix.f == 45.0);
        assert (str == tl.value);
        str = "translate(11 21) translate(20 45) translate(12 23)";
        message (str);
        tl.value = str;
        assert (tl.base_val != null);
        assert (tl.base_val.number_of_items == 3);
        var t5 = tl.base_val.get_item (0);
        assert (t5 != null);
        assert (t5.ttype == Transform.Type.TRANSLATE);
        assert (t5.matrix != null);
        assert (t5.matrix.a == 1.0);
        assert (t5.matrix.b == 0.0);
        assert (t5.matrix.c == 0.0);
        assert (t5.matrix.d == 1.0);
        assert (t5.matrix.e == 11.0);
        assert (t5.matrix.f == 21.0);
        var t6 = tl.base_val.get_item (1);
        assert (t6 != null);
        assert (t6.ttype == Transform.Type.TRANSLATE);
        assert (t6.matrix != null);
        assert (t6.matrix.a == 1.0);
        assert (t6.matrix.b == 0.0);
        assert (t6.matrix.c == 0.0);
        assert (t6.matrix.d == 1.0);
        assert (t6.matrix.e == 20.0);
        assert (t6.matrix.f == 45.0);
        var t7 = tl.base_val.get_item (2);
        assert (t7 != null);
        assert (t7.ttype == Transform.Type.TRANSLATE);
        assert (t7.matrix != null);
        assert (t7.matrix.a == 1.0);
        assert (t7.matrix.b == 0.0);
        assert (t7.matrix.c == 0.0);
        assert (t7.matrix.d == 1.0);
        assert (t7.matrix.e == 12.0);
        assert (t7.matrix.f == 23.0);
        assert (str == tl.value);
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
  }
}
