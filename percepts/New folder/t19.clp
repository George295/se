(ag_percept (percept_pobj ev16) (percept_pname isa) (percept_pval event))
(ag_percept (percept_pobj road1) (percept_pname isa) (percept_pval road))
(ag_percept (percept_pobj line1) (percept_pname isa) (percept_pval line))
(ag_percept (percept_pobj line2) (percept_pname isa) (percept_pval line))
(ag_percept (percept_pobj lane1) (percept_pname isa) (percept_pval lane))
(ag_percept (percept_pobj lane2) (percept_pname isa) (percept_pval lane))

(ag_percept (percept_pobj road1) (percept_pname partof) (percept_pval ev16))
(ag_percept (percept_pobj lane2) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj lane1) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj line1) (percept_pname partof) (percept_pval road1))
(ag_percept (percept_pobj line2) (percept_pname partof) (percept_pval road1))

(ag_percept (percept_pobj line1) (percept_pname type) (percept_pval continuous_line))
(ag_percept (percept_pobj line2) (percept_pname type) (percept_pval broken_white_line))

(ag_percept (percept_pobj line1) (percept_pname type) (percept_pval continuous_line))
(ag_percept (percept_pobj line2) (percept_pname type) (percept_pval continuous_line))

(ag_percept (percept_pobj line1) (percept_pname type) (percept_pval broken_white_line))
(ag_percept (percept_pobj line2) (percept_pname type) (percept_pval continuous_line))
