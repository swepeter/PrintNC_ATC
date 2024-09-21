

connectors:
  Aviation-Plug-M-2:
    pinlabels: [L1, L2]
    type: Aviation Plug 2 pin
    subtype: male
    notes: Male plug Aviation plug 2 pin  # add notes
  Aviation-Plug-M-4:
    pinlabels: [L1, L2, L3, L4]
    type: Aviation Plug 4 pin
    subtype: male
    notes: Male plug Aviation plug 2 pin  # add notes
  Aviation-Plug-M-6:
    pinlabels: [L1, L2, L3, L4, L5, L6]
    type: Aviation Plug 6 pin
    subtype: male
    notes: Male plug Aviation plug 2 pin  # add notes
  Aviation-Plug-F-2:
    pinlabels: [L1, L2]
    type: Aviation Plug 2 pin
    subtype: female
    notes: Male plug Aviation plug 2 pin  # add notes
  Aviation-Plug-F-4:
    pinlabels: [L1, L2, L3, L4]
    type: Aviation Plug 4 pin
    subtype: female
    notes: Male plug Aviation plug 2 pin  # add notes
  Aviation-Plug-F-6:
    pinlabels: [L1, L2, L3, L4, L5, L6]
    type: Aviation Plug 6 pin
    subtype: female
    notes: Male plug Aviation plug 2 pin  # add notes
  X1: &template_con
    pinlabels: [GND, VCC, SCL, SDA]
    type: Molex KK 254
    subtype: male
    notes: to microcontroller # add notes
  X2:
    <<: *template_con # use template
    subtype: female   # but override certain parameters
    notes: to accelerometer
  X3:
    <<: *template_con
    subtype: female
    notes: to temperature sensor

cables:
  RJ45: &RJ45
    wirecount: 8
    colors: [WHOG, OG, WHGN, BU, WHBU, GN, WHBN, BN]
    length: 2.1
    shield: true