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
    Test.add_func ("/gsvg/polyline/point",
    ()=>{
      var p1 = new GsPoint ();
      p1.parse ("1,2");
      assert ("%.2f".printf (p1.x) == "%.2f".printf (1.0));
      assert ("%.2f".printf (p1.y) == "%.2f".printf (2.0));
      assert ("1,2" == p1.to_string ());
    });
    Test.add_func ("/gsvg/polyline/points",
    ()=>{
      var p1 = new GsPoint () as Point;
      p1.parse ("1,2");
      var p2 = new GsPoint () as Point;
      p2.parse ("4,6");
      var points = new GsPointList ();
      points.add (p1);
      points.add (p2);
      assert ("1,2 4,6" == points.value);
    });
    Test.add_func ("/gsvg/polyline/init",
    ()=>{
      try {
        var svg = new GSvg.GsSvg ();
        var pl = svg.create_polyline ("1,2 4,6, 7,9");
        assert (pl is DomElement);
        assert (pl.points != null);
        assert (pl.points.value != null);
        svg.append_child (pl);
        message (svg.write_string ());
        assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><polyline points=\"1,2 4,6 7,9\"/></svg>" in svg.write_string ());
      } catch (GLib.Error e) { warning ("Error: "+e.message); }
    });
    Test.add_func ("/gsvg/polyline/read",
    ()=>{
      var svg = new GSvg.GsSvg ();
      string str = """<?xml version="1.0"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1e+03 3e+02" width="10cm" height="3cm"><desc>Example tspan01 - using tspan to change visual attributes</desc><g font-family="Verdana" font-size="45"><text fill="blue" x="200" y="150">You are <tspan font-weight="bold" fill="red">not</tspan> a banana</text></g><polyline id="polyline" fill="none" stroke="blue" stroke-width="2" points="0,0 10,0 20,1 15,10 10,10"/></svg>""";
      svg.read_from_string (str);
      var sh = svg.get_element_by_id ("polyline") as PolylineElement;
      assert (sh != null);
      assert (sh is PolylineElement);
      assert (sh.id == "polyline");
      message (sh.points.value);
      assert (sh.points.value == "0,0 10,0 20,1 15,10 10,10");
      assert (svg.polylines != null);
      message (svg.write_string ());
      message (svg.polylines_map.length.to_string ());
      assert (sh.node_name == "polyline");
      assert (svg.get_elements_by_tag_name ("polyline").length == 1);
      assert (svg.polylines is PolylineElementMap);
      assert (svg.polylines_map is GsPolylineElementMap);
      assert (svg.polylines_map is PolylineElementMap);
      assert (svg.polylines_map.items_type.is_a (typeof (PolylineElement)));
      assert (svg.polylines_map.length == 1);
      assert (svg.polylines.length == 1);
      assert (svg.polylines.get ("polyline") is PolylineElement);
    });
    return Test.run ();
  }
}
