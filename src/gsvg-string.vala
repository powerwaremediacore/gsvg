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

public class GSvg.GsAnimatedString : Object,
                                    GomProperty,
                                    AnimatedString
{
  public string base_val { get; set; }
  public string anim_val { get; set; }
  public string? value {
    owned get { return base_val; }
    set { base_val = value; }
  }
  public bool validate_value (string val) {
    return true;
  }
}
