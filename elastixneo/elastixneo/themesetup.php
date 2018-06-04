<?php
/* vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4:
  Codificación: UTF-8
  +----------------------------------------------------------------------+
  | Elastix version 0.5                                                  |
  | http://www.elastix.org                                               |
  +----------------------------------------------------------------------+
  | Copyright (c) 2006 Palosanto Solutions S. A.                         |
  +----------------------------------------------------------------------+
  | Cdla. Nueva Kennedy Calle E 222 y 9na. Este                          |
  | Telfs. 2283-268, 2294-440, 2284-356                                  |
  | Guayaquil - Ecuador                                                  |
  | http://www.palosanto.com                                             |
  +----------------------------------------------------------------------+
  | The contents of this file are subject to the General Public License  |
  | (GPL) Version 2 (the "License"); you may not use this file except in |
  | compliance with the License. You may obtain a copy of the License at |
  | http://www.opensource.org/licenses/gpl-license.php                   |
  |                                                                      |
  | Software distributed under the License is distributed on an "AS IS"  |
  | basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See  |
  | the License for the specific language governing rights and           |
  | limitations under the License.                                       |
  +----------------------------------------------------------------------+
  | The Original Code is: Elastix Open Source.                           |
  | The Initial Developer of the Original Code is PaloSanto Solutions    |
  +----------------------------------------------------------------------+
  $Id: index.php,v 1.3 2007/07/17 00:03:42 gcarrillo Exp $ */

function themeSetup(&$smarty, $selectedMenu, $pdbACL, $pACL, $idUser)
{
    /* El tema elastixneo muestra hasta 7 items de menú de primer nivel, y
     * coloca el resto en una lista desplegable a la derecha del último item.
     * Se debe de garantizar que el item actualmente seleccionado aparezca en
     * un menú de primer nivel que esté entre los 7 primeros, reordenando los
     * items si es necesario. */
    $arrMainMenu = $smarty->get_template_vars('arrMainMenu');
    $idMainMenuSelected = $smarty->get_template_vars('idMainMenuSelected');
    $MAX_ITEMS_VISIBLES = 7;
    if (count($arrMainMenu) > $MAX_ITEMS_VISIBLES) {
        // Se transfiere a arreglo numérico para manipular orden de enumeración
        $tempMenulist = array();
        $idxMainMenu = NULL;
        foreach ($arrMainMenu as $key => $value) {
            if ($key == $idMainMenuSelected) $idxMainMenu = count($tempMenulist);
            $tempMenulist[] = array($key, $value);
        }
        if (!is_null($idxMainMenu) && $idxMainMenu >= $MAX_ITEMS_VISIBLES) {
            $menuitem = array_splice($tempMenulist, $idxMainMenu, 1);
            array_splice($tempMenulist, $MAX_ITEMS_VISIBLES - 1, 0, $menuitem);
            $arrMainMenu = array();
            foreach ($tempMenulist as $menuitem) $arrMainMenu[$menuitem[0]] = $menuitem[1];
        }
        unset($tempMenulist);
        $smarty->assign('arrMainMenu', $arrMainMenu);
    }

    $smarty->assign(array(
        "ABOUT_ELASTIX2"            =>  _tr('About Elastix2'),
        "HELP"                      =>  _tr('HELP'),
        "USER_LOGIN"                =>  $_SESSION['elastix_user'],
        "CHANGE_PASSWORD"           =>  _tr("Change Elastix Password"),
        "MODULES_SEARCH"            =>  _tr("Search modules"),
        "ADD_BOOKMARK"              =>  _tr("Add Bookmark"),
        "REMOVE_BOOKMARK"           =>  _tr("Remove Bookmark"),
        "ADDING_BOOKMARK"           =>  _tr("Adding Bookmark"),
        "REMOVING_BOOKMARK"         =>  _tr("Removing Bookmark"),
        "HIDING_IZQTAB"             =>  _tr("Hiding left panel"),
        "SHOWING_IZQTAB"            =>  _tr("Loading left panel"),
        "HIDE_IZQTAB"               =>  _tr("Hide left panel"),
        "SHOW_IZQTAB"               =>  _tr("Load left panel"),

        'viewMenuTab'               =>  getStatusNeoTabToggle($pdbACL, $idUser),
        'MENU_COLOR'                =>  getMenuColorByMenu($pdbACL, $idUser),
        'IMG_BOOKMARKS'             =>  menuIsBookmark($pdbACL, $idUser, $selectedMenu) ? 'bookmarkon.png' : 'bookmark.png',
        'SHORTCUT'                  =>  loadShortcut($pdbACL, $idUser, $smarty),
    ));
}

?>