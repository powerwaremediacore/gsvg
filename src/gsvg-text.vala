/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* css-classes.vala
 *
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
using GLib;
using GXml;
using Gee;

public class GSvg.GsTextContentElement : GSvg.GsCommonShapeElement,
                                  TextContentElement
{
  public AnimatedLength text_length { get { return null; }  }
  public AnimatedEnumeration length_adjust { get { return null; }  }

  public int get_number_of_chars () { return 0; }
  public double get_computed_text_length () { return 0.0; }
  public double get_sub_string_length(int charnum, int nchars) throws GLib.Error { return 0.0; }
  public Point get_start_position_of_char(int charnum) throws GLib.Error { return null; }
  public Point get_end_position_of_char(int charnum) throws GLib.Error { return null; }
  public Rect get_extent_of_char(int charnum) throws GLib.Error { return null; }
  public double get_rotation_of_char(int charnum) throws GLib.Error  { return 0.0; }
  public int get_char_num_at_position(Point point) { return 0; }
  public void select_sub_string(int charnum, int nchars) throws GLib.Error {}
}

public class GSvg.GsTextPositioningElement : GSvg.GsTextContentElement,
                                   TextPositioningElement
{
  [Description (nick="::x")]
  public AnimatedLengthList x { get; set; }
  [Description (nick="::y")]
  public AnimatedLengthList y { get; set; }
  [Description (nick="::dx")]
  public AnimatedLengthList dx { get; set; }
  [Description (nick="::dy")]
  public AnimatedLengthList dy { get; set; }
  [Description (nick="::rotate")]
  public AnimatedNumberList rotate { get; set; }
}

public class GSvg.GsBaseTextElement : GSvg.GsTextPositioningElement,
                                   Transformable
{
  AnimatedTransformList _transform;
  // Transformable
  public AnimatedTransformList transform {
    get { return _transform; }
  }
}
public class GSvg.GsTextElement : GSvg.GsBaseTextElement,
                                 TextElement
{
  construct {
    initialize ("text");
  }
  // API additions
  public DomText add_text (string txt) {
    var t = owner_document.create_text_node (txt);
    append_child (t);
    return t;
  }
  public TSpanElement add_span (string txt) {
    var ts = Object.new (typeof (GsTSpanElement),
                        "owner_document", owner_document)
                        as GsTSpanElement;
    var t = owner_document.create_text_node (txt);
    ts.append_child (t);
    append_child (ts);
    return ts;
  }
  public TRefElement add_ref (string id_ref) { return null; }
  public TextPathElement add_path (string path_ref, string txt) { return null; }
}

public class GSvg.GsTSpanElement : GSvg.GsBaseTextElement,
                                  TSpanElement
{
  construct {
    initialize ("tspan");
  }
}
