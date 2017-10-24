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
    Test.add_func ("/gsvg/text/init",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var t = svg.create_text ("HELLO WORLD", "0", "0", "10", "10", "0");
      svg.append_child (t);
      message (svg.write_string ());
      assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><text x=\"0\" y=\"0\" dx=\"10\" dy=\"10\" rotate=\"0\">HELLO WORLD</text></svg>" in svg.write_string ());
    });
    Test.add_func ("/gsvg/text/span",
    ()=>{
      var svg = new GSvg.GsSvg ();
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
    });
    return Test.run ();
  }
}
