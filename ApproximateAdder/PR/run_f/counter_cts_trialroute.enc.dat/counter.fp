######################################################
#                                                    #
#  Cadence Design Systems                            #
#  FirstEncounter Floor Plan Information             #
#                                                    #
######################################################
# Created by First Encounter v08.10-p004_1 on Tue May 23 22:25:25 2017

Version: 8

Head Box: 0.0000 0.0000 90.0900 90.0400
IO Box: 0.0000 0.0000 90.0900 90.0400
Core Box: 40.0900 40.0400 50.0900 50.0400
UseStdUtil: false

######################################################
#  DesignRoutingHalo: <space> <bottomLayerName> <topLayerName>
######################################################

######################################################
#  Core Rows Parameters:                             #
######################################################
Row Spacing = 0.000000
Row SpacingType = 2
Row Flip = 2
Core Row Site: NCSU_FreePDK_45nm 

##############################################################################
#  DefRow: <name> <site> <x> <y> <orient> <num_x> <num_y> <step_x> <step_y>  #
##############################################################################
DefRow: ROW_0 NCSU_FreePDK_45nm 40.0900 40.0400 FS 52 1 0.1900 0.0000
DefRow: ROW_1 NCSU_FreePDK_45nm 40.0900 41.4400 N 52 1 0.1900 0.0000
DefRow: ROW_2 NCSU_FreePDK_45nm 40.0900 42.8400 FS 52 1 0.1900 0.0000
DefRow: ROW_3 NCSU_FreePDK_45nm 40.0900 44.2400 N 52 1 0.1900 0.0000
DefRow: ROW_4 NCSU_FreePDK_45nm 40.0900 45.6400 FS 52 1 0.1900 0.0000
DefRow: ROW_5 NCSU_FreePDK_45nm 40.0900 47.0400 N 52 1 0.1900 0.0000
DefRow: ROW_6 NCSU_FreePDK_45nm 40.0900 48.4400 FS 52 1 0.1900 0.0000

######################################################
#  Track: dir start number space layer_num layer1 ...#
######################################################
Track: Y 1.7100 56 1.6000 1 10
Track: X 1.5450 53 1.6800 1 10
Track: X 0.7050 107 0.8400 1 9
Track: Y 1.7100 56 1.6000 1 9
Track: Y 0.6300 107 0.8400 1 8
Track: X 0.7050 107 0.8400 1 8
Track: X 0.1450 322 0.2800 1 7
Track: Y 0.6300 107 0.8400 1 7
Track: Y 0.3500 321 0.2800 1 6
Track: X 0.1450 322 0.2800 1 6
Track: X 0.1450 322 0.2800 1 5
Track: Y 0.3500 321 0.2800 1 5
Track: Y 0.0700 643 0.1400 1 4
Track: X 0.1450 322 0.2800 1 4
Track: X 0.0950 474 0.1900 1 3
Track: Y 0.0700 643 0.1400 1 3
Track: Y 0.0700 643 0.1400 1 2
Track: X 0.0950 474 0.1900 1 2
Track: X 0.0950 474 0.1900 1 1
Track: Y 0.0700 643 0.1400 1 1

######################################################
#  GCellGrid: dir start number space                 #
######################################################
GCellGrid: X 89.3950 2 0.6950
GCellGrid: X 0.0950 48 1.9000
GCellGrid: X 0.0000 2 0.0950
GCellGrid: Y 89.6700 2 0.3700
GCellGrid: Y 0.0700 65 1.4000
GCellGrid: Y 0.0000 2 0.0700

######################################################
#  SpareCell: cellName                               #
#  SpareInst: instName                               #
######################################################

######################################################
#  ScanGroup: groupName startPin stopPin             #
######################################################

######################################################
#  JtagCell:  leafCellName                           #
#  JtagInst:  <instName | HInstName>                 #
######################################################

######################################################################################
#  BlackBox: -cell <cell_name> { -size <x> <y> |  -area <um^2> | \                  #
#            -gatecount <count> <areapergate> <utilization> | \                     #
#            {-gateArea <gateAreaValue> [-macroArea <macroAreaValue>]} } \          #
#            [-minwidth <w> | -minheight <h> | -fixedwidh <w> | -fixedheight <h>] \ #
#            [-aspectratio <ratio>]                                                  #
#            [-boxList <nrConstraintBox>                                             #
#              ConstraintBox: <llx> <lly> <urx> <ury>                                #
#              ... ]                                                                 #
######################################################################################

#########################################################
#  PhysicalNet: <name> [-pwr|-gnd|-tiehi|-tielo]        #
#########################################################
PhysicalNet: VDD -pwr
PhysicalNet: VSS -gnd

#########################################################
#  PhysicalInstance: <name> <cell> <orient> <llx> <lly> #
#########################################################

#####################################################################
#  Group: <group_name> <nrHinst> [-isPhyHier]                       #
#    <inst_name>                                                    #
#    ...                                                            #
#####################################################################

#####################################################################
#  Fence:  <name> <llx> <lly> <urx> <ury> <nrConstraintBox>         #
#    ConstraintBox: <llx> <lly> <urx> <ury>                         #
#    ...                                                            #
#  Region: <name> <llx> <lly> <urx> <ury> <nrConstraintBox>         #
#    ConstraintBox: <llx> <lly> <urx> <ury>                         #
#    ...                                                            #
#  Guide:  <name> <llx> <lly> <urx> <ury> <nrConstraintBox>         #
#    ConstraintBox: <llx> <lly> <urx> <ury>                         #
#    ...                                                            #
#  SoftGuide: <name>                                                #
#    ...                                                            #
#####################################################################

###########################################################################
#  <HierarchicalPartitions>                                               #
#     <NetGroup name="group_name" nets=val spacing=val isOptOrder=val isAltLayer=val > #
#         <Net name="net_name" /> ...                                     #
#     </NetGroup>                                                         #
#     <Partition name="ptn_name"  hinst="name"                            #
#         coreToLeft=fval coreToRight=fval coreToTop=fval coreToBottom=fval   #
#         pinSpacingNorth=val pinSpacingWest=val pinSpacingSouth=val      #
#         pinSpacingEast=val  blockedLayers=xval >       #
#         <TrackHalfPitch Horizontal=val Vertical=val />                  #
#         <SpacingHalo left=10.0 right=11.0 top=11.0 bottom=11.0 />       #
#         <Clone hinst="hinst_name" orient=R0|R90|... />                  #
#         <PinLayer side="N|W|S|E" Metal1=yes Metal2=yes ... />           #
#         <RowSize cellHeight=1.0 railWidth=1.0 />                        #
#         <RoutingHalo sideSize=11.0 bottomLayer=M1 topLayer=M2  />       #
#         <SpacingHalo left=11.0 right=11.0 top=11.0 bottom=11.0 />       #
#     </Partition>                                                        #
#     <CellPinGroup name="group_name" cell="cell_name"                    #
#                       pins=nr spacing=val isOptOrder=1 isAltLayer=1 >   #
#         <GroupFTerm name="term_name" /> ...                             #
#     </CellPinGroup>                                                     #
#     <PartitionPinBlockage layerMap=x llx=1 lly=2 urx=3 ury=4 name="n" />#
#     <PinGuide name="name" boxes=num cell="name" >                       #
#        <Box llx=11.0 lly=22.0 urx=33.0 ury=44.0 layer=id /> ...         #
#     </PinGuide>                                                         #
#     <CellPtnCut name="name" cuts=Num >                                  #
#        <Box llx=11.0 lly=22.0 urx=33.0 ury=44.0 /> ...                  #
#     </CellPtnCut>                                                       #
#  </HierarchicalPartitions>                                              #
###########################################################################
<HierarchicalPartitions>
</HierarchicalPartitions>

######################################################
#  Instance: <name> <orient> <llx> <lly>             #
######################################################
Instance: clock__L2_I0 R0 44.8400 44.2400
Instance: clock__L1_I0 MX 49.4000 45.6400
Instance: value_reg_0_ MY 46.3600 44.2400
Instance: value_reg_1_ MX 40.2800 42.8400
Instance: value_reg_2_ R0 40.2800 47.0400
Instance: value_reg_3_ MY 46.5500 47.0400

#################################################################
#  Block: <name> <orient> [<llx> <lly>]                         #
#         [<haloLeftMargin>  <haloBottomMargin>                 #
#          <haloRightMargin> <haloTopMargin> <haloFromInstBox>] #
#         [<IsInstDefCovered> <IsInstPreplaced>]                #
#                                                               #
#  Block with INT_MAX loc is for recording the halo block with  #
#  non-prePlaced status                                         #
#################################################################

######################################################
#  BlockLayerObstruct: <name> <layerX> ...           #
######################################################

######################################################
#  FeedthroughBuffer: <instName>                     #
######################################################

#################################################################
#  <PlacementBlockages>                                         #
#     <Blockage name="blk_name" type="hard|soft|partial">       #
#       <Attr density=1.2 inst="inst_name" pushdown=yes />      #
#       <Box llx=1 lly=2 urx=3 ury=4 /> ...                     #
#     </Blockage>                                               #
#  </PlacementBlockages>                                        #
#################################################################

###########################################################################
#  <RouteBlockages>                                                       #
#     <Blockage name="blk_name" type="User|RouteGuide|PtnCut|WideWire">   #
#       <Attr spacing=1.2 drw=1.2 inst="name" pushdown=yes fills=yes />   #
#       <Layer type="route|cut|masterslice" id=layerNo />                 #
#       <Box llx=1 lly=2 urx=3 ury=4 /> ...                               #
#       <Poly points=nr x0=1 y0=1 x1=2 y2=2 ...  />                       #
#     </Blockage>                                                         #
#  </RouteBlockages>                                                      #
###########################################################################

######################################################
#  PrerouteAsObstruct: <layer_treated_as_obstruct>   #
######################################################
PrerouteAsObstruct: 0x3

######################################################
#  NetWeight: <net_name> <weight (in integer)>       #
######################################################

#################################################################
#  SprFile: <file_name>                                         #
#################################################################
SprFile: counter.fp.spr

#########################################################################################
#  IOPin: <pinName> <x> <y> <side> <layerId> <width> <depth> {placed|fixed|cover|-} <nrBox> \ #
#         [-special] [-clock] [[-spacing <value>] | [-drw <value>]]                     #
#    PinBox: <llx> <lly> <urx> <ury> [-lyr <layerId>] \                                 #
#            [[-spacing <value>] | [-drw <value>]]                                      #
#    PinPoly: <nrPt> <x1> <y1> <x2> <y2> ...<xn> <yn> [-lyr <layerId>] \                #
#             [[-spacing <value>] | [-drw <value>]]                                     #
#    PinAntenna: <pinName> <ANTENNAPIN*> <value> LAYER <layer>                          #
#########################################################################################
IOPin: clock 90.0900 45.9900 E 3 0.0700 0.0700 placed 1
  PinBox: 90.0200 45.9550 90.0900 46.0250 -lyr 3
IOPin: in[3] 90.0900 46.5500 E 3 0.0700 0.0700 placed 1
  PinBox: 90.0200 46.5150 90.0900 46.5850 -lyr 3
IOPin: in[2] 0.0000 44.7300 W 3 0.0700 0.0700 placed 1
  PinBox: 0.0000 44.6950 0.0700 44.7650 -lyr 3
IOPin: in[1] 40.7550 0.0000 S 2 0.0700 0.0700 placed 1
  PinBox: 40.7200 0.0000 40.7900 0.0700 -lyr 2
IOPin: in[0] 45.5050 0.0000 S 2 0.0700 0.0700 placed 1
  PinBox: 45.4700 0.0000 45.5400 0.0700 -lyr 2
IOPin: latch 44.7450 0.0000 S 2 0.0700 0.0700 placed 1
  PinBox: 44.7100 0.0000 44.7800 0.0700 -lyr 2
IOPin: dec 44.3650 0.0000 S 2 0.0700 0.0700 placed 1
  PinBox: 44.3300 0.0000 44.4000 0.0700 -lyr 2
IOPin: zero 46.0750 0.0000 S 2 0.0700 0.0700 placed 1
  PinBox: 46.0400 0.0000 46.1100 0.0700 -lyr 2

##########################################################################
#  <IOPins>                                                              #
#    <Pin name="pin_name" type="clock|power|ground|analog"               #
#         status="covered|fixed|placed" is_special=1 >                   #
#      <Port>                                                            #
#        <Pref x=1 y=2 side="N|S|W|E|U|D" width=w depth=d />             #
#        <Via name="via_name" x=1 y=2 /> ...                             #
#        <Layer id=id spacing=1.2 drw=1.2>                               #
#          <Box llx=1 lly=2 urx=3 ury=4 /> ...                           #
#          <Poly points=nr x0=1 y0=1 x1=2 y2=2 ...           />          #
#        </Layer> ...                                                    #
#      </Port>  ...                                                      #
#    </Pin> ...                                                          #
#  </IOPins>                                                             #
##########################################################################
<IOPins>
  <Pin name="clock" status="placed" >
    <Port>
      <Pref x=90.0900 y=45.9900 side=E width=0.0700 depth=0.0700 />
      <Layer id=3 >
        <Box llx=90.0200 lly=45.9550 urx=90.0900 ury=46.0250 />
      </Layer>
    </Port>
  </Pin>
  <Pin name="in[3]" status="placed" >
    <Port>
      <Pref x=90.0900 y=46.5500 side=E width=0.0700 depth=0.0700 />
      <Layer id=3 >
        <Box llx=90.0200 lly=46.5150 urx=90.0900 ury=46.5850 />
      </Layer>
    </Port>
  </Pin>
  <Pin name="in[2]" status="placed" >
    <Port>
      <Pref x=0.0000 y=44.7300 side=W width=0.0700 depth=0.0700 />
      <Layer id=3 >
        <Box llx=0.0000 lly=44.6950 urx=0.0700 ury=44.7650 />
      </Layer>
    </Port>
  </Pin>
  <Pin name="in[1]" status="placed" >
    <Port>
      <Pref x=40.7550 y=0.0000 side=S width=0.0700 depth=0.0700 />
      <Layer id=2 >
        <Box llx=40.7200 lly=0.0000 urx=40.7900 ury=0.0700 />
      </Layer>
    </Port>
  </Pin>
  <Pin name="in[0]" status="placed" >
    <Port>
      <Pref x=45.5050 y=0.0000 side=S width=0.0700 depth=0.0700 />
      <Layer id=2 >
        <Box llx=45.4700 lly=0.0000 urx=45.5400 ury=0.0700 />
      </Layer>
    </Port>
  </Pin>
  <Pin name="latch" status="placed" >
    <Port>
      <Pref x=44.7450 y=0.0000 side=S width=0.0700 depth=0.0700 />
      <Layer id=2 >
        <Box llx=44.7100 lly=0.0000 urx=44.7800 ury=0.0700 />
      </Layer>
    </Port>
  </Pin>
  <Pin name="dec" status="placed" >
    <Port>
      <Pref x=44.3650 y=0.0000 side=S width=0.0700 depth=0.0700 />
      <Layer id=2 >
        <Box llx=44.3300 lly=0.0000 urx=44.4000 ury=0.0700 />
      </Layer>
    </Port>
  </Pin>
  <Pin name="zero" status="placed" >
    <Port>
      <Pref x=46.0750 y=0.0000 side=S width=0.0700 depth=0.0700 />
      <Layer id=2 >
        <Box llx=46.0400 lly=0.0000 urx=46.1100 ury=0.0700 />
      </Layer>
    </Port>
  </Pin>
</IOPins>

#####################################################################
#  <Property>                                                       #
#     <obj_type name="inst_name" >                                  #
#       <prop name="name" type=type_name value=val />               #
#       <Attr name="name" type=type_name value=val />               #
#     </obj_type>                                                   #
#  </Property>                                                      #
#  where:                                                           #
#       type is data type: Box, String, Int, PTR, Loc, double, Bits #
#       obj_type are: inst, Design, instTerm, Bump, cell, net       #
#####################################################################
<Properties>
</Properties>

###########################################################$############################################################################################
#  GlobalNetConnection: <net_name> {-pin|-inst|-net} <base_name_pattern> -type {pgpin|net|tiehi|tielo} {-all|-module <name>|-region <box>} [-override] #
########################################################################################################################################################
GlobalNetConnection: VDD -pin VDD -type pgpin -all
GlobalNetConnection: VSS -pin VSS -type pgpin -all

################################################################################
#  NetProperties: <net_name> [-special] [-def_prop {int|dbl|str} <value>]...   #
################################################################################
