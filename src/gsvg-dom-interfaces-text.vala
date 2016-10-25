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
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using GXml;

namespace GSvg {

public interface TextContentElement : Object,
                                  Element,
                                  Tests,
                                  LangSpace,
                                  ExternalResourcesRequired,
                                  Stylable {

  public abstract AnimatedLength textLength { get; }
  public abstract AnimatedEnumeration lengthAdjust { get; }

  public abstract long getNumberOfChars();
  public abstract float getComputedTextLength();
  public abstract float getSubStringLength(ulong charnum, ulong nchars) throws GLib.Error;
  public abstract Point getStartPositionOfChar(ulong charnum) throws GLib.Error;
  public abstract Point getEndPositionOfChar(ulong charnum) throws GLib.Error;
  public abstract Rect getExtentOfChar(ulong charnum) throws GLib.Error;
  public abstract float getRotationOfChar(ulong charnum) throws GLib.Error;
  public abstract long getCharNumAtPosition(Point point);
  public abstract void selectSubString(ulong charnum, ulong nchars) throws GLib.Error;
}

  // lengthAdjust Types
public enum LengthAdjust {
  UNKNOWN = 0,
  SPACING = 1,
  SPACINGANDGLYPHS = 2
}

public interface TextPositioningElement : Object,
                                   TextContentElement {
  public abstract AnimatedLengthList x { get; }
  public abstract AnimatedLengthList y { get; }
  public abstract AnimatedLengthList dx { get; }
  public abstract AnimatedLengthList dy { get; }
  public abstract AnimatedNumberList rotate { get; }
}

public interface TextElement : Object,
                                   TextPositioningElement,
                                   Transformable {
}

public interface TSpanElement : Object,
                                   TextPositioningElement {
}

public interface TRefElement : Object,
                                   TextPositioningElement,
                                   URIReference {
}

public interface TextPathElement : Object,
                                   TextContentElement,
                                   URIReference {
  public abstract AnimatedLength startOffset { get; }
  public abstract AnimatedEnumeration method { get; }
  public abstract AnimatedEnumeration spacing { get; }
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
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float dx { get; set; }
  public abstract float dy { get; set; }
}

} // GSvg
