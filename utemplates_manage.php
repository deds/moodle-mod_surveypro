<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Prints a particular instance of surveypro
 *
 * @package    mod_surveypro
 * @copyright  2013 onwards kordan <kordan@mclink.it>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

require_once(dirname(dirname(dirname(__FILE__))).'/config.php');
require_once($CFG->dirroot.'/mod/surveypro/locallib.php');
require_once($CFG->dirroot.'/mod/surveypro/classes/utemplate.class.php');

$id = optional_param('id', 0, PARAM_INT); // course_module ID, or
$s = optional_param('s', 0, PARAM_INT);  // surveypro instance ID

if (!empty($id)) {
    $cm = get_coursemodule_from_id('surveypro', $id, 0, false, MUST_EXIST);
    $course = $DB->get_record('course', array('id' => $cm->course), '*', MUST_EXIST);
    $surveypro = $DB->get_record('surveypro', array('id' => $cm->instance), '*', MUST_EXIST);
} else {
    $surveypro = $DB->get_record('surveypro', array('id' => $s), '*', MUST_EXIST);
    $course = $DB->get_record('course', array('id' => $surveypro->course), '*', MUST_EXIST);
    $cm = get_coursemodule_from_instance('surveypro', $surveypro->id, $course->id, false, MUST_EXIST);
}

require_course_login($course, true, $cm);

$utemplateid = optional_param('fid', 0, PARAM_INT);
$action = optional_param('act', SURVEYPRO_NOACTION, PARAM_INT);
$view = optional_param('view', SURVEYPRO_NOVIEW, PARAM_INT);
$confirm = optional_param('cnf', SURVEYPRO_UNCONFIRMED, PARAM_INT);

$context = context_module::instance($cm->id);
require_capability('mod/surveypro:manageusertemplates', $context);

// -----------------------------
// calculations
// -----------------------------
$utemplateman = new mod_surveypro_usertemplate($cm, $context, $surveypro);
$utemplateman->set_utemplateid($utemplateid);
$utemplateman->set_action($action);
$utemplateman->set_view($view);
$utemplateman->set_confirm($confirm);

$utemplateman->prevent_direct_user_input();

if ($view == SURVEYPRO_EXPORTUTEMPLATE) {
    $utemplateman->export_utemplate();
    die();
}

// -----------------------------
// output starts here
// -----------------------------
$url = new moodle_url('/mod/surveypro/utemplates_manage.php', array('s' => $surveypro->id));
$PAGE->set_url($url);
$PAGE->set_context($context);
$PAGE->set_cm($cm);
$PAGE->set_title($surveypro->name);
$PAGE->set_heading($course->shortname);

// make bold the navigation menu/link that refers to me
navigation_node::override_active_url($url);

echo $OUTPUT->header();

$moduletab = SURVEYPRO_TABUTEMPLATES; // needed by tabs.php
$modulepage = SURVEYPRO_UTEMPLATES_MANAGE; // needed by tabs.php
require_once($CFG->dirroot.'/mod/surveypro/tabs.php');

$utemplateman->delete_utemplate();

$utemplateman->manage_utemplates();
$utemplateman->trigger_event('all_usertemplates_viewed'); // event: all_usertemplates_viewed

// Finish the page
echo $OUTPUT->footer();
