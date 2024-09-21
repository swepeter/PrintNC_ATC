templates:
  X:
    style: simple
    autogenerate: true
    type: ""
    ignore_in_bom: true
  MagContactor: &MagContactor
    manufacturer: Siemens
    pins: [A1, A2, 2/T1, 4/T2, 6/T3, 1/L1, 3/L2, 5/L3, 13, 14]
    hide_disconnected_pins: true

  Phoenix-3x: &Phoenix-3x
    type: Distribution Block
    subtype: Din
    manufacturer: Phoenix
    hide_disconnected_pins: true
  DinDist-1x6: &DinDist-1x6 
    type: Distribution Block
    subtype: Din
    manufacturer: Wago
    pins: [L1, L2, L3, L4, L5, L6]
    hide_disconnected_pins: true
  DinDist-2x6: &DinDist-2x6 
    type: Distribution Block
    subtype: Din
    manufacturer: Wago
    pins: [L1, N1, L2, N2, L3, N3, L4, N4, L5, N5, L6, N6]
    hide_disconnected_pins: true
  RJ45-Panel: &RJ45-Panel
    # autogenerate: true
    type: ""
    ignore_in_bom: true
    pincount: 8
    hide_disconnected_pins: true
  
  StepperMotor: &StepperMotor
    type: Stepper Motor
    pins: [L, G, Stp-, Stp+, Dir-, Dir+, Err-, Err+]
    hide_disconnected_pins: true

  AirRelay: &AirRelay
    type: AirRelay
    pins: [L, G]
    hide_disconnected_pins: true

  Lj8a3: &Lj8a3
    type: EndStop
    subtype: Proximity sensor
    mpn: M8 Lj8a3-2-Z-AX
    pins: [Pwr, Gnd, Sig]

  Probe: &Probe
    type: Probe
    subtype: TomCat Probe
    pins: [Pwr, Gnd, Sig]

  VersProbe: &VersProbe
    type: Probe
    subtype: Vers Probe
    pins: [Pwr, Gnd, Sig, Err]


connectors:
  
  C1-RJ45-1:
    <<: *RJ45-Panel
  C1-RJ45-2-ZM:
    <<: *RJ45-Panel
  C1-RJ45-3-XZES:
    <<: *RJ45-Panel
  C1-RJ45-4-XM:
    <<: *RJ45-Panel
  C1-RJ45-5-Y1M:
    <<: *RJ45-Panel
  C1-RJ45-6-Y2M:
    <<: *RJ45-Panel
  C1-RJ45-7-Y2ES:
    <<: *RJ45-Panel
  C1-RJ45-8-Y1ES:
    <<: *RJ45-Panel
  

  C1-RJ45-9-OutputCtrl:
    <<: *RJ45-Panel
  

  C1-Cont1:
    <<: *MagContactor
  
      
  B1-1:
    <<: *Phoenix-3x
    pins: [L1, L2, L3, L4, L5, L6]
    notes: 110V Line dist block
    #loops: 
    #  - [3,2]
    #  - [3,1]
  B1-2:
    <<: *Phoenix-3x
    pins: [N1, N2, N3, N4, N5, N6]
    notes: 110V Neutral dist block    
  B1-3:
    <<: *DinDist-2x6
    notes: 48v  dist block
  
  P1-1-24:
    type: Power Supply
    subtype: 110v-DC
    manufacturer: MeanWell
    pins: [L, N, G, 1+, 1-, 2+, 2-, 3+, 3-,4+, 4-,5+,5-,6+,6-,7+,7-,8+,8-]
    notes: 24v PS for servos
    hide_disconnected_pins: true
  P1-2-48:
    type: Power Supply
    subtype: 110v-DC
    manufacturer: MeanWell
    mpn: LRS-350-48
    pincount: 9
    pins: [L, N, G, 1+, 1-, 2+, 2-, 3+, 3-]
    notes: 48v PS for servos
    hide_disconnected_pins: true
  

  # Z Heads
  Z-Motor:
    <<: *StepperMotor
  Z-EndStop:
    <<: *Lj8a3

  # X Intersection
  X-EndStop:
    <<: *Lj8a3
  ZX-Connector:
    <<: *RJ45-Panel
  X-Motor:
    <<: *StepperMotor
  Y1-EndStop:
    <<: *Lj8a3
  Y1-Connector:
    <<: *RJ45-Panel


  # Y1 Front
  Y1-Motor:
    <<: *StepperMotor

  
  # Y2 Front
  Y2-Motor:
    <<: *StepperMotor
  
  # Y2 Back
  Y2-EndStop:
    <<: *Lj8a3

  Table-Probe:
    <<: *Probe

  WirelessProbe:
    <<: *VersProbe



  B2-1-48:
    <<: *DinDist-2x6
    notes: 48v dist block
  
  RJ2-1-ZM:
    type: rj45
    pincount: 8 
  
  RJ2-2-Z|XES:
    type: rj45
    pincount: 8 
  RJ2-3-XM:
    type: rj45
    pincount: 8 


  RJ2-4-Y1M:
    type: rj45
    pincount: 8 
  RJ2-5-Y2M:
    type: rj45
    pincount: 8 
  RJ2-2-Y2|T-ES:
    type: rj45
    pincount: 8 
  RJ2-6-Y1ES:
    type: rj45
    pincount: 8 


  C2-29-Y2|T-ES:
    <<: *RJ45-Panel
    type: rj45
    pincount: 8 


  C1-Mesa: 
    hide_disconnected_pins: true
    pins: 
      # PWR
      - TB6.PWR
      - TB6.GND

      # Z Stepper
      - TB10.Z.G
      - TB10.Z.S+
      - TB10.Z.S-
      - TB10.Z.D+
      - TB10.Z.D-
      - TB10.Z.5v

      # Y2 Stepper
      - TB9.Y2.G
      - TB9.Y2.S+
      - TB9.Y2.S-
      - TB9.Y2.D+
      - TB9.Y2.D-
      - TB9.Y2.5v

      # Y1 Stepper
      - TB8.Y1.G
      - TB8.Y1.S+
      - TB8.Y1.S-
      - TB8.Y1.D+
      - TB8.Y1.D-
      - TB8.Y1.5v

      # X Stepper
      - TB7.X.G
      - TB7.X.S+
      - TB7.X.S-
      - TB7.X.D+
      - TB7.X.D-
      - TB7.X.5v

      # Inputs Commons
      - TB2.IC0
      - TB2.IC1
      # Inputs
      - TB1.In1
      - TB1.In2
      - TB1.In3
      - TB1.In4
      - TB1.In5

      # Output
      - TB13.O0+
      - TB13.O0-
      - TB13.O1+
      - TB13.O1-
      - TB13.O2+
      - TB13.O2-
      - TB13.O3+
      - TB13.O3-


  # Air / Output OutputCtrl
  RJ3-1-Air:
    <<: *RJ45-Panel

  B3-1-PWR:
    <<: *DinDist-1x6
    notes: Air Output 24v distribution

  AirSet-1-SpindleRelease:
    <<: *AirRelay
  
  AirSet-2-SpindleLock:
    <<: *AirRelay

cables:
  INT: &INT
    colors: [BK]

  PWR: &PWR
    gauge: 14 awg
    colors: [RDBK, BK]

  PWR_Planned: &PWR_Planned
    gauge: 14 awg
    colors: [RDBKYEYEYE, BKYEYEYE]
    
  PWR_3p: &PWR_3p
    gauge: 14 awg
    colors: [RDBK, BK, YEGN]

  PWR_RD: &PWR_RD
    colors: [RD]
  PWR_BK: &PWR_BK
    colors: [BK]
  
  CBL_BN: &CBL_BN
    colors: [BN]
  
  CBL_YE: &CBL_YE
    colors: [YE]

  CBL_6p: &CBL_6p
    wirecount: 6
    

  RJ45: &RJ45
    wirecount: 8
    colors: [WHOG, OG, WHGN, BU, WHBU, GN, WHBN, BN]
    length: 2.1
    shield: true
  RJ45_Planned: &RJ45_Planned
    wirecount: 8
    colors: [WHOGYEYEYE, OGYEYEYE, WHGNYEYEYE, BUYEYEYE, WHBUYEYEYE, GNYEYEYE, WHBNYEYEYE, BNYEYEYE]
    length: 2.1
    shield: true
    notes: Planned


  
  Lj8a3_Cab: &Lj8a3_Cab
    gauge: 18 awg
    colors: [BN, BU, BK]
    length: 3.9 ft
  Lj8a3_Cab_Planned: &Lj8a3_Cab_Planned
    gauge: 18 awg
    colors: [BN, BU, BK]
    length: 3.9 ft
    notes: Planned


  C1-3-PS1:
    <<: *PWR_3p
    notes: Power for PS1-24v

  C1-6-v48:
    <<: *PWR
    notes: Power for MainSteppers

  C1-7-PS2:
    <<: *PWR_3p
    notes: Power for PS2-48v



  C2-21-ZPwr:
    <<: *PWR
  C2-xx-Pwr:
    <<: *PWR

  C2-1-Y1ES:
    <<: *RJ45
    gauge: 28 awg
    length: 7 ft
  C2-2-Y2ES:
    <<: *RJ45
    gauge: 28 awg
    length: 7 ft


  C2-4-ZES:
    <<: *RJ45
    gauge: 28 awg
    length: 7 ft

  C2-6-Y1M:
    <<: *RJ45
    gauge: 26 awg
    length: 7 ft

  C2-7-Y2M:
    <<: *RJ45
    gauge: 26 awg
    length: 7 ft


  C2-8-XM:
    <<: *RJ45
    gauge: 26 awg
    length: 7 ft

  
  C2-9-ZM:
    <<: *RJ45
    gauge: 26 awg
    length: 7 ft

  C2-20-ZStp:
    <<: *RJ45
    gauge: 26 awg
    length: 10 ft
  

  
  C2-22-X|ZES:
    <<: *RJ45
    gauge: 28 awg
    length: 5 ft
    notes: X|Z EndStop

  C2-23-XM:
    <<: *RJ45
    gauge: 26 awg
    length: 5 ft
    notes: X Motor


  C2-24-XPWR:
    <<: *PWR

  
  C2-25-Y2M:
    <<: *RJ45
    gauge: 26 awg
    notes: Y2 Motor
  C2-26-Y2PWR:
    <<: *PWR

  C2-27-Y1M:
    <<: *RJ45
    gauge: 26 awg
    notes: Y1 Motor (left)
  C2-28-Y1PWR:
    <<: *PWR
  C2-29-Y2|T-ES-Cab:
    <<: *RJ45
    gauge: 26 awg
    notes: Y2 EndStop, Table Probes

#  C2-30-Y2-ES
#  C2-31-T-ES    

  C2-32-Y1ES:
    <<: *RJ45
    gauge: 28 awg
    length: 5 ft
    notes: Y1 EndStop


