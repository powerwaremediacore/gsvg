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

class GSvgTest.Suite : Object
{
  static int main (string args[])
  {
    GLib.Intl.setlocale (GLib.LocaleCategory.ALL, "");
    Test.init (ref args);
    Test.add_func ("/gsvg/rect/style",
    ()=>{
      try {
        var svg = new GSvg.GsSvg ();
        var c = svg.create_circle ("0","0","50mm");
        svg.append_child (c);
        message (svg.write_string ());
        assert ("""<circle cx="0" cy="0" r="50mm"/>""" in svg.write_string ());
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/rect/read",
    ()=>{
      try {
        var svg = new GSvg.GsSvg ();
        string str = """<?xml version="1.0"?>
  <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1e+03 3e+02" width="10cm" height="3cm"><desc>Example tspan01 - using tspan to change visual attributes</desc><g font-family="Verdana" font-size="45"><text fill="blue" x="200" y="150">You are <tspan font-weight="bold" fill="red">not</tspan> a banana</text></g><circle id="circle" fill="none" stroke="blue" stroke-width="2" cx="1" cy="1" r="250"/></svg>""";
        svg.read_from_string (str);
        var sh = svg.get_element_by_id ("circle") as CircleElement;
        assert (sh != null);
        assert (sh is CircleElement);
        assert (sh.cx != null);
        assert (sh.cx.value == "1");
        assert (sh.cy != null);
        assert (sh.cy.value == "1");
        assert (sh.r != null);
        assert (sh.r.value == "250");
        assert (sh.id == "circle");
        assert (svg.circles != null);
        message (svg.write_string ());
        message (svg.circles_map.length.to_string ());
        assert (sh.node_name == "circle");
        assert (svg.get_elements_by_tag_name ("circle").length == 1);
        assert (svg.circles is CircleElementMap);
        assert (svg.circles_map is GsCircleElementMap);
        assert (svg.circles_map is CircleElementMap);
        assert (svg.circles_map.items_type.is_a (typeof (CircleElement)));
        assert (svg.circles_map.length == 1);
        assert (svg.circles.length == 1);
        assert (svg.circles.get ("circle") is CircleElement);
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    return Test.run ();
  }
}
