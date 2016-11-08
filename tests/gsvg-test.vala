/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * pwmui-object-editor.vala
 * Copyright (C) 2015 Daniel Espinosa <esodan@gmail.com>
 *
 */

class GSvgTest.Suite : Object
{
  static int main (string args[])
  {
    GLib.Intl.setlocale (GLib.LocaleCategory.ALL, "");
    Test.init (ref args);
    SvgTest.add_funcs ();
    return Test.run ();
  }
}
