(define (domain PAN)
  (:requirements :strips)
  (:requirements :adl)
  (:requirements :strips :disjunctive-preconditions)
  (:requirements :strips :equality :typing :conditional-effects)  
  (:requirements [:strips] [:equality] [:typing] [:adl])
  (:predicates  
           (ontable ?x)
	       (onpan ?x)
	       (onpan_oil ?x)
	       (onpan_oil_spice ?x)
	       (onpan_oil_spice_salt ?x)
	       
	       (readytoadd)
	       (cooking ?x)
	       )
	       


(:action put-on-pan
	     :parameters (?x)
	     :precondition  (and (cooking ?x) (not(onpan ?x)))
	   
	     :effect
	     (and (not (cooking ?x))
		   
		   (readytoadd)
		   (onpan ?x) )
		   
		   )

(:action ready-to-add-on
	     :parameters (?x)
	     :precondition  (and (readytoadd) (or (onpan ?x) (onpan_oil ?x) (onpan_oil_spice ?x) (onpan_oil_spice_salt ?x)(ontable ?x) ) )  
	     :effect
	    (and 
		 (not (readytoadd)) (not(onpan_oil ?x))(not(ontable ?x)) (not(onpan ?x))(not(onpan_oil_spice ?x)) (not(onpan_oil_spice_salt ?x))
		   (cooking ?x)))	       
  
		   
		   


(:action add-on-oil
	     :parameters (?x)
	     :precondition (and(cooking ?x) (not(onpan_oil ?x)))
	     :effect
	     (and (not (cooking ?x))
		   
		   (readytoadd)
		   (onpan_oil ?x) )
		   
		   )
		   
(:action add-on-oil-spice
	     :parameters (?x)
	     :precondition (and(cooking ?x) (not(onpan_oil_spice ?x)) )
	     :effect
	     (and (not (cooking ?x))
		   
		   (readytoadd)
		   (onpan_oil_spice ?x))
		   
		   )
(:action add-on-oil-spice-salt
	     :parameters (?x)
	     :precondition (and(cooking ?x) (not(onpan_oil_spice_salt ?x)) )
	     :effect
	     (and (not (cooking ?x))
		   
		   (readytoadd)
		   (onpan_oil_spice_salt ?x))
		   
		   )

		   )
		   
		   
