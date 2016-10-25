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

namespace GSvg {

public interface FontElement : Object, SVGElement,
                           ExternalResourcesRequired,
                           Stylable {
}


public interface GlyphElement : Object, SVGElement,
                            Stylable {
}

public interface MissingGlyphElement : Object, SVGElement,
                                   Stylable {
}

public interface HKernElement : Object, SVGElement {
}

public interface VKernElement : Object, SVGElement {
}

public interface FontFaceElement : Object, SVGElement {
}

public interface FontFaceSrcElement : Object, SVGElement {
}

public interface FontFaceUriElement : Object, SVGElement {
}

public interface FontFaceFormatElement : Object, SVGElement {
}

public interface FontFaceNameElement : Object, SVGElement {
}

} // GSvg
