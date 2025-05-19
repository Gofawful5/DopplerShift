/datum/quirk/item_quirk/prescription
	name = "Registered Prescription"
	desc = "You have a medication registered with the pharmacy. Your medical records will be updated to reflect this, and medical staff will do their best to provide you with a supply for the shift."
	var/reagentname
	var/unitnum
	var/unitamt
	var/method_application
	gain_text = span_notice("You feel like you need to take your prescribed medication...")
	lose_text = span_notice("You feel like you don't need a prescription anymore.")
	medical_record_text = "Patient has been prescribed a specified dose of medicine. Please produce this prescription and call them to medical when it is ready."
	value = 0
	icon = FA_ICON_PRESCRIPTION_BOTTLE

/datum/quirk/item_quirk/prescription/post_add()
	var/obj/machinery/announcement_system/aas = get_announcement_system(source = src)
	if (aas)
		aas.broadcast(medical_record_text, list(RADIO_CHANNEL_MEDICAL))

/datum/quirk/item_quirk/prescription/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	reagentname = client_source?.prefs.read_preference(/datum/preference/text/reagentname)
	unitnum = client_source?.prefs.read_preference(/datum/preference/numeric/unitnum)
	unitamt = client_source?.prefs.read_preference(/datum/preference/numeric/unitamt)
	method_application = client_source?.prefs.read_preference(/datum/preference/choiced/method_application)
	medical_record_text = "[human_holder.name] has been prescribed [unitamt] [LOWER_TEXT(method_application)] of [reagentname] with a dose of [unitnum] units per. Please produce this prescription and call them to medical when it is ready."

	var/obj/item/storage/pill_bottle/pillbottle = new(get_turf(human_holder), reagentname)
	give_item_to_holder(pillbottle, list(LOCATION_BACKPACK, LOCATION_HANDS), flavour_text = "[(human_holder.name)] has been prescribed [unitnum] [method_application] of [reagentname] with a dose of [unitnum] units per.")

/datum/quirk/item_quirk/prescription/remove()

/datum/quirk_constant_data/prescription
	associated_typepath = /datum/quirk/item_quirk/prescription
	customization_options = list(
		/datum/preference/text/reagentname,
		/datum/preference/numeric/unitnum,
		/datum/preference/numeric/unitamt,
		/datum/preference/choiced/method_application,
	)

//REAGENT NAME

/datum/preference/text/reagentname
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "reagentname"
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE
	maximum_value_length = 32

/datum/preference/text/reagentname/create_default_value()
	return ""

/datum/preference/text/reagentname/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/text/reagentname/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Registered Prescription" in preferences.all_quirks

/datum/preference/text/reagentname/apply_to_human(mob/living/carbon/human/target, value)
	return

//NUMBER OF UNITS PER

/datum/preference/numeric/unitnum
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "unitnum"
	savefile_identifier = PREFERENCE_CHARACTER
	minimum = 1
	maximum = 50

/datum/preference/numeric/unitnum/create_default_value()
	return 1

/datum/preference/numeric/unitnum/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Registered Prescription" in preferences.all_quirks

/datum/preference/numeric/unitnum/apply_to_human(mob/living/carbon/human/target, value)
	return

//HOW MANY?

/datum/preference/numeric/unitamt
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "unitamt"
	savefile_identifier = PREFERENCE_CHARACTER
	minimum = 1
	maximum = 10

/datum/preference/numeric/unitamt/create_default_value()
	return 1

/datum/preference/numeric/unitamt/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Registered Prescription" in preferences.all_quirks

/datum/preference/numeric/unitamt/apply_to_human(mob/living/carbon/human/target, value)
	return

//APPLICATION METHOD

/datum/preference/choiced/method_application
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "method_application"
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE

/datum/preference/choiced/method_application/init_possible_values()
	return assoc_to_keys(list("Pills","Patches","Bottles"))

/datum/preference/choiced/method_application/create_default_value()
	return pick(list("Pills","Patches","Bottles"))

/datum/preference/choiced/method_application/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Registered Prescription" in preferences.all_quirks

/datum/preference/choiced/method_application/apply_to_human(mob/living/carbon/human/target, value)
	return
