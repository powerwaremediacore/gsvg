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
  public AnimatedLength text_length { get; set; }
  public AnimatedEnumeration length_adjust { get; set; }

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
                                   TextPositioningElement {
  public AnimatedLengthList x { get; set; }
  public AnimatedLengthList y { get; set; }
  public AnimatedLengthList dx { get; set; }
  public AnimatedLengthList dy { get; set; }
  public AnimatedNumberList rotate { get; set; }
}

public class GSvg.GsTextElement : GSvg.GsTextPositioningElement,
                                   Transformable,
                                   TextElement
{
  AnimatedTransformList _transform;
  // Transformable
  public AnimatedTransformList transform {
    get { return _transform; }
  }
}
