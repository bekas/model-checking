	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC checkLogic */
;
		;
		
	case 4: /* STATE 2 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Worker */
;
		;
		
	case 6: /* STATE 3 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 8: /* STATE 7 */
		;
		rescount[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[1];
		now.res[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 9: /* STATE 10 */
		goto R999;
;
		;
		
	case 11: /* STATE 20 */
		;
		((P0 *)this)->i = trpt->bup.ovals[2];
		((P0 *)this)->success = trpt->bup.ovals[1];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 12: /* STATE 20 */
		;
		((P0 *)this)->i = trpt->bup.ovals[1];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 13: /* STATE 20 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: /* STATE 27 */
		;
		now.anysuccess = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: /* STATE 29 */
		;
		now.quorumsuccess = trpt->bup.oval;
		;
		goto R999;

	case 18: /* STATE 32 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 21: /* STATE 45 */
		;
		((P0 *)this)->i = trpt->bup.ovals[4];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[3];
		((P0 *)this)->success = trpt->bup.ovals[2];
		rescount[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[1];
		now.res[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 22: /* STATE 45 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 23: /* STATE 45 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 24: /* STATE 58 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 27: /* STATE 71 */
		;
		((P0 *)this)->i = trpt->bup.ovals[4];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[3];
		((P0 *)this)->success = trpt->bup.ovals[2];
		rescount[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[1];
		now.res[ Index(((P0 *)this)->i, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 28: /* STATE 71 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 29: /* STATE 71 */
		;
		((P0 *)this)->i = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 31: /* STATE 78 */
		;
		now.anysuccess = trpt->bup.oval;
		;
		goto R999;

	case 32: /* STATE 79 */
		;
		now.quorumsuccess = trpt->bup.oval;
		;
		goto R999;

	case 33: /* STATE 81 */
		;
		now.anysuccess = trpt->bup.oval;
		;
		goto R999;

	case 34: /* STATE 87 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

