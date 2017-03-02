/*
 * MVPCocoa Copyright (C) 2016 Fatih.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

public enum IconSet {
	case ic_ac_unit
	case ic_access_alarm
	case ic_access_alarms
	case ic_acess_time
	case ic_add_a_photo
	case ic_add_alarm
	case ic_add_alert
	case ic_add_box
	case ic_add_circle_outline
	case ic_add_circle
	case ic_add_location
	case ic_add_to_photos
	case ic_add_to_queue
	case ic_add
	case ic_adjust
	case ic_airplanemode_active
	case ic_airplanemode_inactive
	case ic_airplay
	case ic_airport_shuttle
	case ic_album
	case ic_all_inclusive
	case ic_apps
	case ic_archive
	case ic_arrow_back
	case ic_arrow_downward
	case ic_arrow_drop_down_circle
	case ic_arrow_drop_down
	case ic_arrow_drop_up
	case ic_arrow_forward
	case ic_arrow_upward
	case ic_art_track
	case ic_assistant_photo
	case ic_assistant
	case ic_attach_file
	case ic_attach_money
	case ic_attachment
	case ic_audiotrack
	case ic_av_timer
	case ic_backspace
	case ic_battery_20
	case ic_battery_30
	case ic_battery_50
	case ic_battery_60
	case ic_battery_80
	case ic_battery_90
	case ic_battery_alert
	case ic_battery_charging_20
	case ic_battery_charging_30
	case ic_battery_charging_50
	case ic_battery_charging_60
	case ic_battery_charging_80
	case ic_battery_charging_90
	case ic_battery_charging_full
	case ic_battery_full
	case ic_battery_std
	case ic_battery_unknown
	case ic_beach_access
	case ic_block
	case ic_bluetooth_connected
	case ic_bluetooth_disabled
	case ic_bluetooth_searching
	case ic_bluetooth
	case ic_blur_circular
	case ic_blur_linear
	case ic_blur_off
	case ic_blur_on
	case ic_border_all
	case ic_border_bottom
	case ic_border_clear
	case ic_border_color
	case ic_border_horizontal
	case ic_border_inner
	case ic_border_left
	case ic_border_outer
	case ic_border_right
	case ic_border_style
	case ic_border_top
	case ic_border_vertical
	case ic_branding_watermark
	case ic_brightness_1
	case ic_brightness_2
	case ic_brightness_3
	case ic_brightness_4
	case ic_brightness_5
	case ic_brightness_6
	case ic_brightness_7
	case ic_brightness_auto
	case ic_brightness_high
	case ic_brightness_low
	case ic_brightness_medium
	case ic_broken_image
	case ic_brush
	case ic_bubble_chart
	case ic_burst_mode
	case ic_business_center
	case ic_business
	case ic_cake
	case ic_call_end
	case ic_call_made
	case ic_call_merge
	case ic_call_missed_outgoing
	case ic_call_missed
	case ic_call_received
	case ic_call_split
	case ic_call_to_action
	case ic_call
	case ic_camera_alt
	case ic_camera_front
	case ic_camera_rear
	case ic_camera_roll
	case ic_camera
	case ic_cancel
	case ic_casino
	case ic_cast_connected
	case ic_cast
	case ic_center_focus_strong
	case ic_center_focus_weak
	case ic_chat_bubble_outline
	case ic_chat_bubble
	case ic_chat
	case ic_check_box_outline_blank
	case ic_check_box
	case ic_check
	case ic_chevron_left
	case ic_chevron_right
	case ic_child_care
	case ic_child_friendly
	case ic_clear_all
	case ic_clear
	case ic_close
	case ic_closed_caption
	case ic_cloud_circle
	case ic_cloud_done
	case ic_cloud_download
	case ic_cloud_off
	case ic_cloud_queue
	case ic_cloud_upload
	case ic_cloud
	case ic_collections_bookmark
	case ic_collections
	case ic_color_lens
	case ic_colorize
	case ic_comment
	case ic_compare
	case ic_computer
	case ic_contact_mail
	case ic_contact_phone
	case ic_contacts
	case ic_content_copy
	case ic_content_cut
	case ic_content_paste
	case ic_control_point_duplicate
	case ic_control_point
	case ic_create_new_folder
	case ic_create
	case ic_crop_3_2
	case ic_crop_5_4
	case ic_crop_7_5
	case ic_crop_16_9
	case ic_crop_din
	case ic_crop_free
	case ic_crop_landscape
	case ic_crop_original
	case ic_crop_portrait
	case ic_crop_rotate
	case ic_crop_square
	case ic_crop
	case ic_data_usage
	case ic_dehaze
	case ic_delete_sweep
	case ic_desktop_mac
	case ic_desktop_windows
	case ic_details
	case ic_developer_board
	case ic_developer_mode
	case ic_device_hub
	case ic_devices_other
	case ic_devices
	case ic_dialer_sip
	case ic_dialpad
	case ic_directions_bike
	case ic_directions_boat
	case ic_directions_bus
	case ic_directions_car
	case ic_directions_railway
	case ic_directions_run
	case ic_directions_subway
	case ic_directions_transit
	case ic_directions_walk
	case ic_directions
	case ic_dock
	case ic_domain
	case ic_drafts
	case ic_drag_handle
	case ic_dvr
	case ic_edit_location
	case ic_edit
	case ic_email
	case ic_equalizer
	case ic_error_outline_red
	case ic_error_outline
	case ic_error_red
	case ic_error
	case ic_ev_station
	case ic_expand_less
	case ic_expand_more
	case ic_explicit
	case ic_exposure_neg_1
	case ic_exposure_neg_2
	case ic_exposure_plus_1
	case ic_exposure_plus_2
	case ic_exposure_zero
	case ic_exposure
	case ic_fast_forward
	case ic_fast_rewind
	case ic_featured_play_list
	case ic_featured_video
	case ic_fiber_dvr
	case ic_fiber_manual_record
	case ic_fiber_new
	case ic_fiber_pin
	case ic_fiber_smart_record
	case ic_file_download
	case ic_file_upload
	case ic_filter_1
	case ic_filter_2
	case ic_filter_3
	case ic_filter_4
	case ic_filter_5
	case ic_filter_6
	case ic_filter_7
	case ic_filter_8
	case ic_filter_9_plus
	case ic_filter_9
	case ic_filter_b_and_w
	case ic_filter_center_focus
	case ic_filter_drama
	case ic_filter_frames
	case ic_filter_hdr
	case ic_filter_list
	case ic_filter_none
	case ic_filter_tilt_shift
	case ic_filter_vintage
	case ic_filter
	case ic_first_page
	case ic_fitness_center
	case ic_flag
	case ic_flare
	case ic_flash_auto
	case ic_flash_off
	case ic_flash_on
	case ic_flight
	case ic_flip
	case ic_folder_open
	case ic_folder_shared
	case ic_folder
	case ic_format_align_center
	case ic_format_align_justify
	case ic_format_align_left
	case ic_format_align_right
	case ic_format_bold
	case ic_format_clear
	case ic_format_color_fill
	case ic_format_color_reset
	case ic_format_color_text
	case ic_format_indent_decrease
	case ic_format_indent_increase
	case ic_format_italic
	case ic_format_line_spacing
	case ic_format_list_bulleted
	case ic_format_list_numbered
	case ic_format_paint
	case ic_format_quote
	case ic_format_shapes
	case ic_format_size
	case ic_format_strikethrough
	case ic_format_textdirection_l_to_r
	case ic_format_textdirection_r_to_l
	case ic_format_underlined
	case ic_forum
	case ic_forward_5
	case ic_forward_10
	case ic_forward_30
	case ic_forward
	case ic_free_breakfast
	case ic_fullscreen_exit
	case ic_fullscreen
	case ic_functions
	case ic_gamepad
	case ic_games
	case ic_gesture
	case ic_golf_course
	case ic_gps_fixed
	case ic_gps_not_fixed
	case ic_gps_off
	case ic_gradient
	case ic_grain
	case ic_graphic_eq
	case ic_grid_off
	case ic_grid_on
	case ic_group_add
	case ic_group
	case ic_hd
	case ic_hdr_off
	case ic_hdr_on
	case ic_hdr_strong
	case ic_hdr_weak
	case ic_headset_mic
	case ic_headset
	case ic_healing
	case ic_hearing
	case ic_high_quality
	case ic_highlight
	case ic_hot_tub
	case ic_hotel
	case ic_image_aspect_ratio
	case ic_image
	case ic_import_contacts
	case ic_import_export
	case ic_inbox
	case ic_indeterminate_check_box
	case ic_insert_chart
	case ic_insert_comment
	case ic_insert_drive_file
	case ic_insert_emoticon
	case ic_insert_invitation_white
	case ic_insert_link
	case ic_insert_photo
	case ic_invert_colors_off
	case ic_ios
	case ic_keyboard_arrow_down
	case ic_keyboard_arrow_left
	case ic_keyboard_arrow_right
	case ic_keyboard_arrow_up
	case ic_keyboard_backspace
	case ic_keyboard_capslock
	case ic_keyboard_hide
	case ic_keyboard_return
	case ic_keyboard_tab
	case ic_keyboard_voice
	case ic_keyboard
	case ic_kitchen
	case ic_landscape
	case ic_laptop_chromebook
	case ic_laptop_mac
	case ic_laptop_windows
	case ic_laptop
	case ic_last_page
	case ic_layers_clear
	case ic_layers
	case ic_leak_add
	case ic_leak_remove
	case ic_lens
	case ic_library_add
	case ic_library_books
	case ic_library_music
	case ic_linear_scale
	case ic_link
	case ic_linked_camera
	case ic_live_help
	case ic_local_activity
	case ic_local_airport
	case ic_local_atm
	case ic_local_bar
	case ic_local_cafe
	case ic_local_car_wash
	case ic_local_convenience_store
	case ic_local_dining
	case ic_local_drink
	case ic_local_florist
	case ic_local_gas_station
	case ic_local_grocery_store
	case ic_local_hospital
	case ic_local_hotel
	case ic_local_laundry_service
	case ic_local_library
	case ic_local_mall
	case ic_local_movies
	case ic_local_offer
	case ic_local_parking
	case ic_local_pharmacy
	case ic_local_phone
	case ic_local_pizza
	case ic_local_play
	case ic_local_post_office
	case ic_local_printshop
	case ic_local_see
	case ic_local_shipping
	case ic_local_taxi
	case ic_location_city
	case ic_location_disabled
	case ic_location_off
	case ic_location_on
	case ic_location_searching
	case ic_looks_3
	case ic_looks_4
	case ic_looks_5
	case ic_looks_6
	case ic_looks_one
	case ic_looks_two
	case ic_looks
	case ic_loop
	case ic_loupe
	case ic_low_priority
	case ic_loyalty
	case ic_mail_outline
	case ic_mail
	case ic_map
	case ic_markunread_mailbox
	case ic_markunread
	case ic_memory
	case ic_menu
	case ic_merge_type
	case ic_message
	case ic_mic_none
	case ic_mic_off
	case ic_mic
	case ic_mode_edit
	case ic_mode_comment
	case ic_monetization_on
	case ic_money_off
	case ic_monochrome_photos
	case ic_mood_bad
	case ic_mood
	case ic_more_horiz
	case ic_more_vert
	case ic_motorcycle
	case ic_mouse
	case ic_move_to_inbox
	case ic_movie_creation
	case ic_movie_filter
	case ic_movie
	case ic_multiline_chart
	case ic_music_note
	case ic_music_video
	case ic_my_location
	case ic_nature_people
	case ic_nature
	case ic_navigate_before
	case ic_navigate_next
	case ic_navigation
	case ic_near_me
	case ic_network_cell
	case ic_network_wifi
	case ic_new_releases
	case ic_next_week
	case ic_nfc
	case ic_no_sim
	case ic_not_interested
	case ic_note_add
	case ic_note
	case ic_notifications_active
	case ic_notifications_none
	case ic_notifications_off
	case ic_notifications_paused
	case ic_notifications
	case ic_offline_pin
	case ic_opacity
	case ic_open_in_browser
	case ic_open_in_new
	case ic_open_with
	case ic_pages
	case ic_pageview
	case ic_palette
	case ic_pan_tool
	case ic_panorama_fish_eye
	case ic_panorama_horizontal
	case ic_panorama_vertical
	case ic_panorama_wide_angle
	case ic_panorama
	case ic_party_mode
	case ic_pause_circle_filled
	case ic_pause_circle_outline
	case ic_pause
	case ic_payment
	case ic_people_outline
	case ic_people
	case ic_perm_camera_mic
	case ic_perm_contact_calendar
	case ic_perm_data_setting
	case ic_perm_device_information
	case ic_perm_identity
	case ic_perm_media
	case ic_perm_phone_msg
	case ic_perm_scan_wifi
	case ic_person_add
	case ic_person_outline
	case ic_person_pin_circle
	case ic_person_pin
	case ic_person
	case ic_pets
	case ic_phone_android
	case ic_phone_iphone
	case ic_phone
	case ic_phonelink_erase
	case ic_phonelink_lock
	case ic_phonelink_off
	case ic_phonelink_ring
	case ic_phonelink_setup
	case ic_phonelink
	case ic_photo_album
	case ic_photo_camera
	case ic_photo_filter
	case ic_photo_library
	case ic_photo_size_select_actual
	case ic_photo_size_select_large
	case ic_photo_size_select_small
	case ic_photo
	case ic_picture_as_pdf
	case ic_picture_in_picture_alt
	case ic_picture_in_picture
	case ic_pie_chart_outlined
	case ic_pie_chart
	case ic_pin_drop
	case ic_place
	case ic_play_arrow
	case ic_play_circle_filled
	case ic_play_circle_outline
	case ic_play_for_work
	case ic_playlist_add_check
	case ic_playlist_add
	case ic_playlist_play
	case ic_plus_one
	case ic_poll
	case ic_polymer
	case ic_pool
	case ic_portable_wifi_off
	case ic_portrait
	case ic_power_input
	case ic_power_settings_new
	case ic_pregnant_woman
	case ic_present_to_all
	case ic_print
	case ic_public
	case ic_publish
	case ic_query_builder
	case ic_question_answer
	case ic_queue_music
	case ic_queue_play_next
	case ic_queue
	case ic_radio_button_checked
	case ic_radio_button_unchecked
	case ic_radio
	case ic_rate_review
	case ic_receipt
	case ic_recent_actors
	case ic_record_voice_over
	case ic_redeem
	case ic_redo
	case ic_refresh
	case ic_remove_circle_outline
	case ic_remove_circle
	case ic_remove_from_queue
	case ic_remove_red_eye
	case ic_remove_shopping_cart
	case ic_remove
	case ic_reorder
	case ic_repeat_one
	case ic_repeat
	case ic_replay_5
	case ic_replay_10
	case ic_replay_30
	case ic_replay
	case ic_reply_all
	case ic_reply
	case ic_report_problem
	case ic_report
	case ic_restaurant_menu
	case ic_restaurant
	case ic_restore_page
	case ic_restore
	case ic_ring_volume
	case ic_room_service
	case ic_room
	case ic_rotate_90_degrees_ccw
	case ic_rotate_left
	case ic_rotate_right
	case ic_rounded_corner
	case ic_router
	case ic_rowing
	case ic_rss_feed
	case ic_rv_hookup
	case ic_satellite
	case ic_save
	case ic_scanner
	case ic_schedule
	case ic_school
	case ic_screen_lock_landscape
	case ic_screen_lock_portrait
	case ic_screen_lock_rotation
	case ic_screen_rotation
	case ic_screen_share
	case ic_sd_storage
	case ic_search
	case ic_security
	case ic_select_all
	case ic_send
	case ic_sentiment_dissatisfied
	case ic_sentiment_neutral
	case ic_sentiment_satisfied
	case ic_sentiment_very_satisfied
	case ic_sentiment_very_dissatisfied
	case ic_settings_applications
	case ic_settings_backup_restore
	case ic_settings_bluetooth
	case ic_settings_brightness
	case ic_settings_cell
	case ic_settings_ethernet
	case ic_settings_input_antenna
	case ic_settings_input_component
	case ic_settings_input_composite
	case ic_settings_input_hdmi
	case ic_settings_input_svideo
	case ic_settings_overscan
	case ic_settings_phone
	case ic_settings_power
	case ic_settings_remote
	case ic_settings_system_daydream
	case ic_settings_voice
	case ic_settings
	case ic_share
	case ic_shop_two
	case ic_shop
	case ic_shopping_basket
	case ic_shopping_cart
	case ic_short_text
	case ic_show_chart
	case ic_shuffle
	case ic_signal_cellular_0_bar
	case ic_signal_cellular_1_bar
	case ic_signal_cellular_2_bar
	case ic_signal_cellular_3_bar
	case ic_signal_cellular_4_bar
	case ic_signal_cellular_connected_no_internet_0_bar
	case ic_signal_cellular_connected_no_internet_1_bar
	case ic_signal_cellular_connected_no_internet_2_bar
	case ic_signal_cellular_connected_no_internet_3_bar
	case ic_signal_cellular_connected_no_internet_4_bar
	case ic_signal_cellular_no_sim
	case ic_signal_cellular_null
	case ic_signal_cellular_off
	case ic_signal_wifi_0_bar
	case ic_signal_wifi_1_bar
	case ic_signal_wifi_1_bar_lock
	case ic_signal_wifi_2_bar
	case ic_signal_wifi_2_bar_lock
	case ic_signal_wifi_3_bar
	case ic_signal_wifi_3_bar_lock
	case ic_signal_wifi_4_bar
	case ic_signal_wifi_4_bar_lock
	case ic_signal_wifi_off
	case ic_sim_card
	case ic_skip_next
	case ic_skip_previous
	case ic_slideshow
	case ic_slow_motion_video
	case ic_smartphone
	case ic_smoke_free
	case ic_smoking_rooms
	case ic_snooze
	case ic_sort_by_alpha
	case ic_sort
	case ic_spa
	case ic_space_bar
	case ic_speaker_group
	case ic_speaker_notes_off
	case ic_speaker_notes
	case ic_speaker_phone
	case ic_speaker
	case ic_spellcheck
	case ic_star_border
	case ic_star_half
	case ic_star
	case ic_stars
	case ic_stay_current_landscape
	case ic_stay_current_portrait
	case ic_stay_primary_landscape
	case ic_stay_primary_portrait
	case ic_stop_screen_share
	case ic_stop
	case ic_storage
	case ic_store_mall_directory
	case ic_store
	case ic_straighten
	case ic_streetview
	case ic_strikethrough_s
	case ic_style
	case ic_subdirectory_arrow_left
	case ic_subdirectory_arrow_right
	case ic_subject
	case ic_subscriptions
	case ic_subtitles
	case ic_subway
	case ic_supervisor_account
	case ic_surround_sound
	case ic_swap_calls
	case ic_swap_horiz
	case ic_swap_vert
	case ic_swap_vertical_circle
	case ic_switch_camera
	case ic_switch_video
	case ic_system_update_alt
	case ic_tab_unselected
	case ic_tab
	case ic_tablet_android
	case ic_tablet_mac
	case ic_tablet
	case ic_tag_faces
	case ic_terrain
	case ic_text_fields
	case ic_text_format
	case ic_textsms
	case ic_texture
	case ic_theaters
	case ic_thumb_down
	case ic_thumb_up
	case ic_thumbs_up_down
	case ic_timelapse
	case ic_timeline
	case ic_timer_3
	case ic_timer_10
	case ic_timer_off
	case ic_timer
	case ic_title
	case ic_toc
	case ic_today
	case ic_toll
	case ic_tonality
	case ic_touch_app
	case ic_toys
	case ic_track_changes
	case ic_traffic
	case ic_train
	case ic_tram
	case ic_transfer_within_a_station
	case ic_transform
	case ic_translate
	case ic_trending_down
	case ic_trending_flat
	case ic_trending_up
	case ic_tune
	case ic_turned_in_not
	case ic_turned_in
	case ic_tv
	case ic_unarchive
	case ic_undo
	case ic_unfold_less
	case ic_unfold_more
	case ic_update
	case ic_usb
	case ic_verified_user
	case ic_vertical_align_bottom
	case ic_vertical_align_center
	case ic_vertical_align_top
	case ic_video_call
	case ic_video_label
	case ic_video_library
	case ic_video_off
	case ic_videocam_off
	case ic_videocam
	case ic_videogame_asset
	case ic_view_agenda
	case ic_view_array
	case ic_view_carousel
	case ic_view_column
	case ic_view_comfy
	case ic_view_compact
	case ic_view_day
	case ic_view_headline
	case ic_view_list
	case ic_view_module
	case ic_view_quit
	case ic_view_stream
	case ic_view_week
	case ic_vignette
	case ic_visibility_off
	case ic_visibility
	case ic_voicemail
	case ic_volume_down
	case ic_volume_mute
	case ic_volume_off
	case ic_volume_up
	case ic_vpn_key
	case ic_wallpaper
	case ic_warning_amber
	case ic_warning
	case ic_watch_later
	case ic_watch
	case ic_wb_auto
	case ic_wb_cloudy
	case ic_wb_incandescent
	case ic_wb_iridescent
	case ic_wb_sunny
	case ic_web_asset
	case ic_web
	case ic_weekend
	case ic_whatshot
	case ic_widgets
	case ic_wifi_lock
	case ic_wifi_tethering
	case ic_work
	case ic_wrap_text
	case ic_youtube_searched_for
	case ic_zoom_in
	case ic_zoom_out_map
	case ic_zoom
	case ic_3d_rotation
	case ic_accessible
	case ic_account_balance_wallet
	case ic_account_balance
	case ic_account_box
	case ic_account_circle
	case ic_add_shopping_cart
	case ic_alarm_add
	case ic_alarm_off
	case ic_alarm_on
	case ic_alarm
	case ic_all_out
	case ic_android
	case ic_announcement
	case ic_aspect_ratio
	case ic_assessment
	case ic_assessment_ind
	case ic_assessment_late
	case ic_assessment_return
	case ic_assessment_returned
	case ic_assessment_turned_in
	case ic_assignment
	case ic_autorenew
	case ic_backup
	case ic_book
	case ic_bookmark
	case ic_build
	case ic_cached
	case ic_camera_enhance
	case ic_card_giftcard
	case ic_card_membership
	case ic_card_travel
	case ic_change_history
	case ic_check_circle
	case ic_chrome_reader_mode
	case ic_class
	case ic_code
	case ic_compare_arrows
	case ic_copyright_googred
	case ic_copyright
	case ic_credit_card
	case ic_dashboard
	case ic_date_range
	case ic_delete_forever
	case ic_delete
	case ic_description
	case ic_dns
	case ic_done_all
	case ic_done
	case ic_donut_large
	case ic_donut_small
	case ic_eject
	case ic_euro_symbol
	case ic_event_seat
	case ic_event
	case ic_exit_to_app
	case ic_explore
	case ic_face
	case ic_favorite_border
	case ic_favorite
	case ic_feedback
	case ic_find_in_page
	case ic_find_replace
	case ic_fingerprint
	case ic_flight_land
	case ic_flight_takeoff
	case ic_flip_to_back
	case ic_flip_to_front
	case ic_g_translate
	case ic_gavel
	case ic_get_app
	case ic_gift
	case ic_grade
	case ic_group_work
	case ic_help_outline
	case ic_help
	case ic_highlight_off
	case ic_history
	case ic_home
	case ic_hourglass_empty
	case ic_hourglass_full
	case ic_http
	case ic_https
	case ic_important_devices
	case ic_info_outline
	case ic_input
	case ic_invert_colors
	case ic_label_outline
	case ic_label
	case ic_language
	case ic_launch
	case ic_lightbulb_outline
	case ic_line_style
	case ic_line_weight
	case ic_list
	case ic_lock_open
	case ic_lock_outline
	case ic_lock
}





















































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


























