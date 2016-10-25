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

public interface SVGTextContentElement : Object,
                                  SVGElement,
                                  SVGTests,
                                  SVGLangSpace,
                                  SVGExternalResourcesRequired,
                                  SVGStylable {

  public abstract SVGAnimatedLength textLength { get; }
  public abstract SVGAnimatedEnumeration lengthAdjust { get; }

  public abstract long getNumberOfChars();
  public abstract float getComputedTextLength();
  public abstract float getSubStringLength(ulong charnum, ulong nchars) throws GLib.Error;
  public abstract SVGPoint getStartPositionOfChar(ulong charnum) throws GLib.Error;
  public abstract SVGPoint getEndPositionOfChar(ulong charnum) throws GLib.Error;
  public abstract SVGRect getExtentOfChar(ulong charnum) throws GLib.Error;
  public abstract float getRotationOfChar(ulong charnum) throws GLib.Error;
  public abstract long getCharNumAtPosition(SVGPoint point);
  public abstract void selectSubString(ulong charnum, ulong nchars) throws GLib.Error;
}

  // lengthAdjust Types
public enum LengthAdjust {
  UNKNOWN = 0,
  SPACING = 1,
  SPACINGANDGLYPHS = 2
}

public interface SVGTextPositioningElement : Object,
                                   SVGTextContentElement {
  public abstract SVGAnimatedLengthList x { get; }
  public abstract SVGAnimatedLengthList y { get; }
  public abstract SVGAnimatedLengthList dx { get; }
  public abstract SVGAnimatedLengthList dy { get; }
  public abstract SVGAnimatedNumberList rotate { get; }
}

public interface SVGTextElement : Object,
                                   SVGTextPositioningElement,
                                   SVGTransformable {
}

public interface SVGTSpanElement : Object,
                                   SVGTextPositioningElement {
}

public interface SVGTRefElement : Object,
                                   SVGTextPositioningElement,
                                   SVGURIReference {
}

public interface SVGTextPathElement : Object,
                                   SVGTextContentElement,
                                   SVGURIReference {
  public abstract SVGAnimatedLength startOffset { get; }
  public abstract SVGAnimatedEnumeration method { get; }
  public abstract SVGAnimatedEnumeration spacing { get; }
}


// textPath Method Types
public enum SVGTextPathMethodType {
  UNKNOWN = 0,
  ALIGN = 1,
  STRETCH = 2
}

  // textPath Spacing Types
public enum SVGTextPathSpacingType {
  UNKNOWN = 0,
  AUTO = 1,
  EXACT = 2
}

public interface SVGAltGlyphElement : Object,
                                   SVGTextPositioningElement,
                                   SVGURIReference {
  public abstract string glyphRef { get; set; }
  public abstract string format { get; set; }
}

public interface SVGAltGlyphDefElement : Object, SVGElement {
}

public interface SVGAltGlyphItemElement : Object, SVGElement {
}

public interface SVGGlyphRefElement : Object,
                               SVGElement,
                               SVGURIReference,
                               SVGStylable {
  public abstract string glyphRef { get; set; }
  public abstract string format { get; set; }
  public abstract float x { get; set; }
  public abstract float y { get; set; }
  public abstract float dx { get; set; }
  public abstract float dy { get; set; }
}


