/* gsvg-dom-interfaces-text.vala
 *
 * Copyright (C) 2016 Daniel Espinosa <daniel.espinosa@pwmc.mx>
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
 * aint with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using GXml;

namespace GSvg {

public interface TextContentElement : Object,
                                  Element,
                                  Tests,
                                  LangSpace,
                                  ExternalResourcesRequired,
                                  Stylable
{
  public abstract AnimatedLength text_length { get; }
  public abstract AnimatedEnumeration length_adjust { get; }

  public abstract int get_number_of_chars ();
  public abstract double get_computed_text_length();
  public abstract double get_sub_string_length(int charnum, int nchars) throws GLib.Error;
  public abstract Point get_start_position_of_char(int charnum) throws GLib.Error;
  public abstract Point get_end_position_of_char(int charnum) throws GLib.Error;
  public abstract Rect get_extent_of_char(int charnum) throws GLib.Error;
  public abstract double get_rotation_of_char(int charnum) throws GLib.Error;
  public abstract int get_char_num_at_position(Point point);
  public abstract void select_sub_string(int charnum, int nchars) throws GLib.Error;
}

  // lengthAdjust Types
public enum LengthAdjust {
  UNKNOWN = 0,
  SPACING = 1,
  SPACINGANDGLYPHS = 2
}

public interface TextPositioningElement : Object,
                                   TextContentElement {
  public abstract AnimatedLengthList x { get; set; }
  public abstract AnimatedLengthList y { get; set; }
  public abstract AnimatedLengthList dx { get; set; }
  public abstract AnimatedLengthList dy { get; set; }
  public abstract AnimatedNumberList rotate { get; set; }
}

public interface TextElement : Object,
                                   TextPositioningElement,
                                   Transformable
{
  // API Additions
  public abstract TSpanElementMap spans { get; }
  public abstract TRefElementMap trefs { get; }
  /**
   * Adds a new {@link DomText} node with the given text
   */
  public abstract DomText         add_text (string txt);
  /**
   * Adds a new {@link TSpanElement} node with the given text
   */
  public abstract TSpanElement    add_span (string txt);
  /**
   * Adds a new {@link TRefElement} node with the given reference
   */
  public abstract TRefElement     add_ref (string id_ref);
  /**
   * Adds a new {@link TextPathElement} node with the given text
   * using given reference path
   */
  public abstract TextPathElement add_path (string path_ref, string txt);
}

public interface TextElementMap : Object {
  public abstract int length { get; }
  public abstract TextElement get (string id);
}
public interface TSpanElement : Object,
                                   TextPositioningElement {
}
public interface TSpanElementMap : Object {
  public abstract int length { get; }
  public abstract TSpanElement get (string id);
}

public interface TRefElement : Object,
                                   TextPositioningElement,
                                   URIReference {
}
public interface TRefElementMap : Object {
  public abstract int length { get; }
  public abstract TRefElement get (string id);
}

public interface TextPathElement : Object,
                                   TextContentElement,
                                   URIReference {
  public abstract AnimatedLength startOffset { get; set; }
  public abstract AnimatedEnumeration method { get; set; }
  public abstract AnimatedEnumeration spacing { get; set; }
}


// textPath Method Types
public enum TextPathMethodType {
  UNKNOWN = 0,
  ALIGN = 1,
  STRETCH = 2
}

  // textPath Spacing Types
public enum TextPathSpacingType {
  UNKNOWN = 0,
  AUTO = 1,
  EXACT = 2
}

public interface AltGlyphElement : Object,
                                   TextPositioningElement,
                                   URIReference {
  public abstract string glyphRef { get; set; }
  public abstract string format { get; set; }
}

public interface AltGlyphDefElement : Object, Element {
}

public interface AltGlyphItemElement : Object, Element {
}

public interface GlyphRefElement : Object,
                               Element,
                               URIReference,
                               Stylable {
  public abstract string glyphRef { get; set; }
  public abstract string format { get; set; }
  public abstract double x { get; set; }
  public abstract double y { get; set; }
  public abstract double dx { get; set; }
  public abstract double dy { get; set; }
}

} // GSvg
