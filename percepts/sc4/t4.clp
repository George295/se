(ag_percept (percept_pobj ev15) (percept_pname isa) (percept_pval event))
(ag_percept (percept_pobj road1) (percept_pname isa) (percept_pval road))
(ag_percept (percept_pobj road_sign1) (percept_pname isa) (percept_pval road_sign))
(ag_percept (percept_pobj line1) (percept_pname isa) (percept_pval line))
(ag_percept (percept_pobj lane1) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj lane2) (percept_pname isa) (percept_pval lane))

(ag_percept (percept_pobj parapet1) (percept_pname isa) (percept_pval parapet))
(ag_percept (percept_pobj parapet2) (percept_pname isa) (percept_pval parapet))

(ag_percept (percept_pobj road1) (percept_pname partof) (percept_pval ev15))
(ag_percept (percept_pobj lane2) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj lane1) (percept_pname partof) (percept_pval road1))

(ag_percept (percept_pobj parapet1) (percept_pname partof) (percept_pval lane1))
(ag_percept (percept_pobj parapet2) (percept_pname partof) (percept_pval lane2))
(ag_percept (percept_pobj line1) (percept_pname type) (percept_pval continuous_line))

(ag_percept (percept_pobj car1) (percept_pname isa) (percept_pval car))
(ag_percept (percept_pobj car1) (percept_pname partof) (percept_pval lane1))

(ag_percept (percept_pobj road_sign1) (percept_pname type) (percept_pval river_bridge_name))

