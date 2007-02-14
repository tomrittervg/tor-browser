/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is mozilla.org code.
 *
 * The Initial Developer of the Original Code is
 * Netscape Communications Corporation.
 * Portions created by the Initial Developer are Copyright (C) 1998
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   pschwartau@netscape.com
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */
/*
 *This test arose from Bugzilla bug 58946.
 *The bug was filed when we got the following error (see code below):
 *
 *                          "ReferenceError: e is not defined"
 *
 *There was no error if we replaced "return e" in the code below with "print(e)".
 *There should be no error with "return e", either  -
 */
//-------------------------------------------------------------------------------------------------
var THE_ERROR = "return_error";

startTest();

var stat = "Testing a return statement inside a catch block inside a function";
printStatus (stat);
var testcases = getTestCases();
test();

function getTestCases()
{
    var array = new Array();
    var item = 0;

    var thisError = throwError();
    
    array[item++] = new TestCase(SECTION, "throwError()", THE_ERROR, thisError);
    
    return array;
}

function throwError()
{
	try
	{
		throw THE_ERROR;
	}
	catch(e)
	{
		return e;
	}
}
