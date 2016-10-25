/* gsvg-dom-interfaces-fonts.vala
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

public interface SVGFontElement : Object, VGElement,
                           SVGExternalResourcesRequired,
                           SVGStylable {
}


public interface SVGGlyphElement : Object, VGElement,
                            SVGStylable {
}

public interface SVGMissingGlyphElement : Object, VGElement,
                                   SVGStylable {
}

public interface SVGHKernElement : Object, VGElement {
}

public interface SVGVKernElement : Object, VGElement {
}

public interface SVGFontFaceElement : Object, VGElement {
}

public interface SVGFontFaceSrcElement : Object, VGElement {
}

public interface SVGFontFaceUriElement : Object, VGElement {
}

public interface SVGFontFaceFormatElement : Object, VGElement {
}

public interface SVGFontFaceNameElement : Object, VGElement {
}
