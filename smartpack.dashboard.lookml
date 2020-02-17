- dashboard: smartpack_trailer_insights
  title: Smartpack Trailer Insights
  layout: newspaper
  elements:
  - title: Idle Time
    name: Idle Time
    model: smart_pack
    explore: master_spt_wmt
    type: looker_timeline
    fields: [master_spt_wmt.door_number, master_spt_wmt.load_opened_time, master_spt_wmt.load_closed_time,
      master_spt_wmt.idle_time_percentage, master_spt_wmt.total_loads]
    sorts: [master_spt_wmt.load_opened_time desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 1ebd8493-ebcc-4e57-a4ff-ab3e6111da24
      options:
        steps: 5
        reverse: true
    groupBars: true
    labelSize: 12pt
    valueFormat: ''
    showLegend: true
    series_types: {}
    listen:
      Event Date: master_spt_wmt.load_opened_date
    row: 6
    col: 0
    width: 8
    height: 7
  - title: Idle Time by Door
    name: Idle Time by Door
    model: smart_pack
    explore: master_spt_wmt
    type: looker_column
    fields: [master_spt_wmt.door_number, master_spt_wmt.idle_time, master_spt_wmt.total_loads]
    sorts: [master_spt_wmt.idle_time]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: master_spt_wmt.idle_time,
            id: master_spt_wmt.idle_time, name: Idle Time}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: master_spt_wmt.total_loads, id: master_spt_wmt.total_loads,
            name: Total Loads}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    groupBars: true
    labelSize: 10pt
    showLegend: false
    hidden_fields: []
    listen:
      Event Date: master_spt_wmt.load_opened_date
    row: 6
    col: 8
    width: 8
    height: 7
  - name: "<b>Idle Time</b>"
    type: text
    title_text: "<b>Idle Time</b>"
    subtitle_text: "<i>Idle Time Metric</i>"
    row: 4
    col: 0
    width: 24
    height: 2
  - title: Total Doors
    name: Total Doors
    model: smart_pack
    explore: master_spt_wmt
    type: single_value
    fields: [master_spt_wmt.total_doors]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Event Date: master_spt_wmt.load_opened_date
    row: 0
    col: 5
    width: 4
    height: 4
  - title: Total Loads
    name: Total Loads
    model: smart_pack
    explore: master_spt_wmt
    type: single_value
    fields: [master_spt_wmt.overall_average_wall_depth, master_spt_wmt.average_number_of_walls]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Average Wall Depth
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Avg Walls/Load
    series_types: {}
    listen:
      Event Date: master_spt_wmt.load_opened_date
    row: 0
    col: 14
    width: 5
    height: 4
  - title: Idle Time
    name: Idle Time
    model: smart_pack
    explore: master_spt_wmt
    type: single_value
    fields: [master_spt_wmt.idle_time, master_spt_wmt.total_load_duration_hours, master_spt_wmt.total_idle_time_hours,
      master_spt_wmt.total_loads]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Idle Time
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Total Duration Hours
    series_types: {}
    listen:
      Event Date: master_spt_wmt.load_opened_date
    row: 0
    col: 9
    width: 5
    height: 4
  - title: Average Fullness
    name: Average Fullness
    model: smart_pack
    explore: master_spt_wmt
    type: single_value
    fields: [master_spt_wmt.average_fullness_per_load, master_spt_wmt.total_loads,
      master_spt_wmt.idle_time, master_spt_wmt.total_idle_time_hours, master_spt_wmt.total_load_duration_hours]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Avg Fullness/Load
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Total Loads
    series_types: {}
    listen:
      Event Date: master_spt_wmt.load_opened_date
    row: 0
    col: 19
    width: 5
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div align="center"> <img src="https://upload.wikimedia.org/wikipedia/en/8/87/Zebra_tech_logo15.png" height="110px"> </div>
      <br>
    row: 0
    col: 0
    width: 5
    height: 4
  - title: Idle Time by Shift
    name: Idle Time by Shift
    model: smart_pack
    explore: master_spt_wmt
    type: looker_line
    fields: [master_spt_wmt.load_opened_date, master_spt_wmt.starting_shift, master_spt_wmt.idle_time]
    pivots: [master_spt_wmt.starting_shift]
    filters:
      master_spt_wmt.starting_shift: "-Unclassified"
    sorts: [master_spt_wmt.load_opened_date, master_spt_wmt.starting_shift]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: false
    listen:
      Event Date: master_spt_wmt.load_opened_date
    row: 6
    col: 16
    width: 8
    height: 7
  filters:
  - name: Event Date
    title: Event Date
    type: field_filter
    default_value: 1 years
    allow_multiple_values: true
    required: false
    model: smart_pack
    explore: master_spt_wmt
    listens_to_filters: []
    field: master_spt_wmt.load_opened_date
