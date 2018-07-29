/*
 * Copyright (C) 2018 by David Baum <david.baum@naraesk.eu>
 *
 * This file is part of plasma-yamaha.
 *
 * plasma-yamaha is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-yamaha is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-yamaha.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import org.kde.plasma.configuration 2.0


ConfigModel {
    ConfigCategory {
         name: qsTr('General')
         icon: 'format-text-code'
         source: 'config/Config.qml'
    }

    ConfigCategory {
         name: qsTr('Scene 1')
         icon: 'format-text-code'
         source: 'config/Scene1.qml'
    }

    ConfigCategory {
         name: qsTr('Scene 2')
         icon: 'format-text-code'
         source: 'config/Scene2.qml'
    }
} 
