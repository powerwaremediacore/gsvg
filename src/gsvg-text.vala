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
  public AnimatedLengthList x { get; set; }
  [Description (nick="::x")]
  public GsAnimatedLengthList mx {
    get { return x as GsAnimatedLengthList; }
    set { x = value as AnimatedLengthList; }
  }
  public AnimatedLengthList y { get; set; }
  [Description (nick="::y")]
  public GsAnimatedLengthList my {
    get { return y as GsAnimatedLengthList; }
    set { y = value as AnimatedLengthList; }
  }
  public AnimatedLengthList dx { get; set; }
  [Description (nick="::dx")]
  public GsAnimatedLengthList mdx {
    get { return dx as GsAnimatedLengthList; }
    set { dx = value as AnimatedLengthList; }
  }
  public AnimatedLengthList dy { get; set; }
  [Description (nick="::dy")]
  public GsAnimatedLengthList mdy {
    get { return dy as GsAnimatedLengthList; }
    set { dy = value as AnimatedLengthList; }
  }
  public AnimatedNumberList rotate { get; set; }
  [Description (nick="::rotate")]
  public GsAnimatedNumberList mrotate {
    get { return rotate as GsAnimatedNumberList; }
    set { rotate = value as AnimatedNumberList; }
  }
}

public class GSvg.GsBaseTextElement : GSvg.GsTextPositioningElement,
                                   Transformable
{
  // Transformable
  public AnimatedTransformList transform { get; set; }
}
public class GSvg.GsTextElement : GSvg.GsBaseTextElement,
                                 TextElement, MappeableElement
{
  construct {
    initialize ("text");
  }
  // API additions
  private GsTSpanElementMap _spans_map;
  // ContainerElement
  public TSpanElementMap spans { get { return _spans_map as TSpanElementMap; } }
  public GsTSpanElementMap spans_map {
    get {
      if (_spans_map == null)
        set_instance_property ("spans-maps");
      return _spans_map;
    }
    set {
      if (_spans_map != null)
        clean_property_elements ("spans-maps");
      _spans_map = value;
    }
  }
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
  public TRefElement add_ref (string id_ref) {
    var ts = Object.new (typeof (GsTRefElement),
                        "owner_document", owner_document)
                        as GsTRefElement;
    append_child (ts);
    var r = new GsAnimatedString ();
    r.base_val = id_ref;
    ts.href = r;
    return ts;
  }
  public TextPathElement add_path (string path_ref, string txt) { return null; }
  // MappeableElement
  public string get_map_key () { return id; }
}

public class GSvg.GsTextElementMap : GomHashMap, TextElementMap {
  public int length { get { return (this as GomHashMap).length; } }
  construct { initialize (typeof (GsTextElement)); }
  public TextElement TextElementMap.get (string id) {
    return (this as GomHashMap).get (id) as TextElement;
  }
}

public class GSvg.GsTSpanElement : GSvg.GsBaseTextElement,
                                  TSpanElement, MappeableElement
{
  construct {
    initialize ("tspan");
  }
  // MappeableElement
  public string get_map_key () { return id; }
}

public class GSvg.GsTSpanElementMap : GomHashMap, TSpanElementMap {
  public int length { get { return (this as GomHashMap).length; } }
  construct { initialize (typeof (GsTSpanElement)); }
  public TSpanElement TSpanElementMap.get (string id) {
    return (this as GomHashMap).get (id) as TSpanElement;
  }
}

public class GSvg.GsTRefElement : GSvg.GsBaseTextElement,
                                   URIReference,
                                   TRefElement, MappeableElement
{
  construct {
    initialize ("tref");
    if (owner_document.document_element.lookup_prefix ("http://www.w3.org/1999/xlink") == null)
          owner_document.document_element.set_attribute_ns ("http://www.w3.org/2000/xmlns",
                          "xmlns:xlink",
                          "http://www.w3.org/1999/xlink");
  }
  public AnimatedString href { get; set; }
  [Description (nick="::xlink:href")]
  public GsAnimatedString mhref {
    get { return href as GsAnimatedString; }
    set { href = value as AnimatedString; }
  }
  // MappeableElement
  public string get_map_key () { return id; }
}

public class GSvg.GsTRefElementMap : GomHashMap, TRefElementMap {
  public int length { get { return (this as GomHashMap).length; } }
  construct { initialize (typeof (GsTRefElement)); }
  public TRefElement TRefElementMap.get (string id) {
    return (this as GomHashMap).get (id) as TRefElement;
  }
}
