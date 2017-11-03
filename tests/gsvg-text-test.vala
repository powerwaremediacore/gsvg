/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * gsvg-test.vala

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

class GSvgTest.Suite : Object
{
  static int main (string args[])
  {
    GLib.Intl.setlocale (GLib.LocaleCategory.ALL, "");
    Test.init (ref args);
    Test.add_func ("/gsvg/text/write",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
        var t = svg.create_text ("HELLO WORLD", "0", "0", "10", "10", "0");
        svg.append_child (t);
        message (svg.write_string ());
        assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><text x=\"0\" y=\"0\" dx=\"10\" dy=\"10\" rotate=\"0\">HELLO WORLD</text></svg>" in svg.write_string ());
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/text/read",
    ()=>{var svg = new GSvg.GsSVGElement ();
      string str = """<svg xmlns="http://www.w3.org/2000/svg"><text id="text" x="0" y="0" dx="10" dy="10" rotate="0">HELLO WORLD</text></svg>""";
      svg.read_from_string (str);
      var t = svg.get_element_by_id ("text") as TextElement;
      assert (t != null);
      assert (t is TextElement);
      assert (t.text_content == "HELLO WORLD");
      assert (svg.texts != null);
      assert (svg.texts.get ("text") is TextElement);
    });
    Test.add_func ("/gsvg/text/span/write",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
        var t = svg.create_text ("IS", "0", "0", "10", "10", "0");
        svg.append_child (t);
        t.add_span ("TIME");
        t.add_text ("FOR ME");
        message (svg.write_string ());
        assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><text x=\"0\" y=\"0\" dx=\"10\" dy=\"10\" rotate=\"0\">IS<tspan>TIME</tspan>FOR ME</text></svg>" in svg.write_string ());
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/text/span/read",
    ()=>{
      var svg = new GSvg.GsSVGElement ();
      string str = """<svg xmlns="http://www.w3.org/2000/svg"><text id="text" x="0" y="0" dx="10" dy="10" rotate="0">IS<tspan id = "span">TIME</tspan>FOR ME</text></svg>""";
      svg.read_from_string (str);
      var t = svg.get_element_by_id ("text") as TextElement;
      assert (t != null);
      assert (t is TextElement);
      var ts = svg.get_element_by_id ("span") as TSpanElement;
      assert (ts != null);
      assert (ts is TSpanElement);
      assert (ts.text_content == "TIME");
      assert (t.spans != null);
      assert (t.spans.get ("span") is TSpanElement);
    });
    Test.add_func ("/gsvg/text/tref/write",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
        var tr = svg.create_text ("Inline character data","100", "100", null, null, null);
        tr.font_size = "45";
        tr.fill = "blue";
        tr.id = "ReferencedText";
        assert (tr.get_attribute ("id") == "ReferencedText");
        var defs = svg.add_defs ();
        defs.append_child (tr);
        var t1 = svg.create_text (null, "0", "0", "100", "100", "0");
        svg.append_child (t1);
        t1.add_ref ("ReferencedText");
        var t2 = svg.create_text (null, "0", "0", "100", "100", "0");
        svg.append_child (t2);
        t2.add_ref ("ReferencedText");
        message (svg.write_string ());
        assert ("<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs><text id=\"ReferencedText\" font-size=\"45\" fill=\"blue\" x=\"100\" y=\"100\">Inline character data</text></defs><text x=\"0\" y=\"0\" dx=\"100\" dy=\"100\" rotate=\"0\"><tref xlink:href=\"ReferencedText\"/></text><text x=\"0\" y=\"0\" dx=\"100\" dy=\"100\" rotate=\"0\"><tref xlink:href=\"ReferencedText\"/></text></svg>" in svg.write_string ());
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/text/tref/read",
    ()=>{
      var svg = new GSvg.GsSVGElement ();
      string str = """<svg xmlns="http://www.w3.org/2000/svg"><defs><text id="ReferencedText" font-size="45" fill="blue" x="100" y="100">Inline character data</text></defs><text id="text">IS<tref id="tref" xlink:href="ReferencedText"/></text></svg>""";
      svg.read_from_string (str);
      var t = svg.get_element_by_id ("text") as TextElement;
      assert (t != null);
      assert (t is TextElement);
      var tr = svg.get_element_by_id ("tref") as TRefElement;
      assert (tr != null);
      assert (tr is TRefElement);
      assert (tr.href != null);
      assert (tr.href.value == "ReferencedText");
      assert (t.trefs != null);
      assert (t.trefs.get ("tref") is TRefElement);
    });
    return Test.run ();
  }
}
