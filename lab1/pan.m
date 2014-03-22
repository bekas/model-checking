#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC checkLogic */
	case 3: /* STATE 1 - 1:70 - [assert((quorumsuccess<2))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		spin_assert((now.quorumsuccess<2), "(quorumsuccess<2)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - 1:71 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Worker */
	case 5: /* STATE 2 - 1:33 - [((anysuccess==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((now.anysuccess==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 3 - 1:34 - [i = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 4 - 1:34 - [((i<=(5-1)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][4] = 1;
		if (!((((P0 *)this)->i<=(5-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 5 - 1:11 - [((res[i]==0))] (18:0:2 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!((now.res[ Index(((P0 *)this)->i, 5) ]==0)))
			continue;
		/* merge: res[i] = num(18, 6, 18) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.res[ Index(((P0 *)this)->i, 5) ];
		now.res[ Index(((P0 *)this)->i, 5) ] = ((P0 *)this)->num;
#ifdef VAR_RANGES
		logval("res[Worker:i]", now.res[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: rescount[i] = (rescount[i]+1)(18, 7, 18) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[1] = rescount[ Index(((P0 *)this)->i, 5) ];
		rescount[ Index(((P0 *)this)->i, 5) ] = (rescount[ Index(((P0 *)this)->i, 5) ]+1);
#ifdef VAR_RANGES
		logval("rescount[Worker:i]", rescount[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: .(goto)(18, 10, 18) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 9: /* STATE 10 - 1:14 - [.(goto)] (0:18:0 - 2) */
		IfNotBlocked
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 13 - 1:37 - [((res[i]==num))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		if (!((now.res[ Index(((P0 *)this)->i, 5) ]==((P0 *)this)->num)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 14 - 1:37 - [locked[i] = 1] (0:23:3 - 1) */
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = 1;
#ifdef VAR_RANGES
		logval("Worker:locked[Worker:i]", ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: success = (success+1)(23, 15, 23) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->success;
		((P0 *)this)->success = (((P0 *)this)->success+1);
#ifdef VAR_RANGES
		logval("Worker:success", ((P0 *)this)->success);
#endif
		;
		/* merge: .(goto)(23, 19, 23) */
		reached[0][19] = 1;
		;
		/* merge: i = (i+1)(23, 20, 23) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 24, 23) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 12: /* STATE 17 - 1:38 - [locked[i] = 0] (0:23:2 - 1) */
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("Worker:locked[Worker:i]", ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: .(goto)(23, 19, 23) */
		reached[0][19] = 1;
		;
		/* merge: i = (i+1)(23, 20, 23) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals[1] = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 24, 23) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 13: /* STATE 20 - 1:34 - [i = (i+1)] (0:23:1 - 3) */
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 24, 23) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 14: /* STATE 26 - 1:42 - [((success>=quorum))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][26] = 1;
		if (!((((P0 *)this)->success>=now.quorum)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 27 - 1:42 - [anysuccess = num] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][27] = 1;
		(trpt+1)->bup.oval = now.anysuccess;
		now.anysuccess = ((P0 *)this)->num;
#ifdef VAR_RANGES
		logval("anysuccess", now.anysuccess);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 28 - 1:42 - [printf('i`m winer %d\\n',num)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		Printf("i`m winer %d\n", ((P0 *)this)->num);
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 29 - 1:42 - [quorumsuccess = (quorumsuccess+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][29] = 1;
		(trpt+1)->bup.oval = now.quorumsuccess;
		now.quorumsuccess = (now.quorumsuccess+1);
#ifdef VAR_RANGES
		logval("quorumsuccess", now.quorumsuccess);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 31 - 1:44 - [printf('i`m looser %d\\n',num)] (0:48:1 - 1) */
		IfNotBlocked
		reached[0][31] = 1;
		Printf("i`m looser %d\n", ((P0 *)this)->num);
		/* merge: i = 0(48, 32, 48) */
		reached[0][32] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 49, 48) */
		reached[0][49] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 19: /* STATE 33 - 1:45 - [((i<=(5-1)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][33] = 1;
		if (!((((P0 *)this)->i<=(5-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 34 - 1:47 - [((locked[i]==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][34] = 1;
		if (!((((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 35 - 1:19 - [res[i] = 0] (0:48:5 - 1) */
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.res[ Index(((P0 *)this)->i, 5) ];
		now.res[ Index(((P0 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("res[Worker:i]", now.res[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: rescount[i] = (rescount[i]-1)(48, 36, 48) */
		reached[0][36] = 1;
		(trpt+1)->bup.ovals[1] = rescount[ Index(((P0 *)this)->i, 5) ];
		rescount[ Index(((P0 *)this)->i, 5) ] = (rescount[ Index(((P0 *)this)->i, 5) ]-1);
#ifdef VAR_RANGES
		logval("rescount[Worker:i]", rescount[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: success = (success-1)(48, 39, 48) */
		reached[0][39] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->success;
		((P0 *)this)->success = (((P0 *)this)->success-1);
#ifdef VAR_RANGES
		logval("Worker:success", ((P0 *)this)->success);
#endif
		;
		/* merge: locked[i] = 0(48, 40, 48) */
		reached[0][40] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("Worker:locked[Worker:i]", ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: .(goto)(48, 44, 48) */
		reached[0][44] = 1;
		;
		/* merge: i = (i+1)(48, 45, 48) */
		reached[0][45] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 49, 48) */
		reached[0][49] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 22: /* STATE 42 - 1:48 - [((locked[i]==0))] (48:0:1 - 1) */
		IfNotBlocked
		reached[0][42] = 1;
		if (!((((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]==0)))
			continue;
		/* merge: .(goto)(48, 44, 48) */
		reached[0][44] = 1;
		;
		/* merge: i = (i+1)(48, 45, 48) */
		reached[0][45] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 49, 48) */
		reached[0][49] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 23: /* STATE 45 - 1:45 - [i = (i+1)] (0:48:1 - 3) */
		IfNotBlocked
		reached[0][45] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 49, 48) */
		reached[0][49] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 24: /* STATE 58 - 1:55 - [i = 0] (0:74:1 - 3) */
		IfNotBlocked
		reached[0][58] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 75, 74) */
		reached[0][75] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 25: /* STATE 59 - 1:55 - [((i<=(5-1)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][59] = 1;
		if (!((((P0 *)this)->i<=(5-1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 60 - 1:57 - [((locked[i]==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][60] = 1;
		if (!((((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 61 - 1:19 - [res[i] = 0] (0:74:5 - 1) */
		IfNotBlocked
		reached[0][61] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.res[ Index(((P0 *)this)->i, 5) ];
		now.res[ Index(((P0 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("res[Worker:i]", now.res[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: rescount[i] = (rescount[i]-1)(74, 62, 74) */
		reached[0][62] = 1;
		(trpt+1)->bup.ovals[1] = rescount[ Index(((P0 *)this)->i, 5) ];
		rescount[ Index(((P0 *)this)->i, 5) ] = (rescount[ Index(((P0 *)this)->i, 5) ]-1);
#ifdef VAR_RANGES
		logval("rescount[Worker:i]", rescount[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: success = (success-1)(74, 65, 74) */
		reached[0][65] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->success;
		((P0 *)this)->success = (((P0 *)this)->success-1);
#ifdef VAR_RANGES
		logval("Worker:success", ((P0 *)this)->success);
#endif
		;
		/* merge: locked[i] = 0(74, 66, 74) */
		reached[0][66] = 1;
		(trpt+1)->bup.ovals[3] = ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ];
		((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ] = 0;
#ifdef VAR_RANGES
		logval("Worker:locked[Worker:i]", ((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]);
#endif
		;
		/* merge: .(goto)(74, 70, 74) */
		reached[0][70] = 1;
		;
		/* merge: i = (i+1)(74, 71, 74) */
		reached[0][71] = 1;
		(trpt+1)->bup.ovals[4] = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 75, 74) */
		reached[0][75] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 28: /* STATE 68 - 1:58 - [((locked[i]==0))] (74:0:1 - 1) */
		IfNotBlocked
		reached[0][68] = 1;
		if (!((((P0 *)this)->locked[ Index(((P0 *)this)->i, 5) ]==0)))
			continue;
		/* merge: .(goto)(74, 70, 74) */
		reached[0][70] = 1;
		;
		/* merge: i = (i+1)(74, 71, 74) */
		reached[0][71] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 75, 74) */
		reached[0][75] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 29: /* STATE 71 - 1:55 - [i = (i+1)] (0:74:1 - 3) */
		IfNotBlocked
		reached[0][71] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->i;
		((P0 *)this)->i = (((P0 *)this)->i+1);
#ifdef VAR_RANGES
		logval("Worker:i", ((P0 *)this)->i);
#endif
		;
		/* merge: .(goto)(0, 75, 74) */
		reached[0][75] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 30: /* STATE 77 - 1:62 - [((anysuccess==num))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		if (!((now.anysuccess==((P0 *)this)->num)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: /* STATE 78 - 1:62 - [anysuccess = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][78] = 1;
		(trpt+1)->bup.oval = now.anysuccess;
		now.anysuccess = 0;
#ifdef VAR_RANGES
		logval("anysuccess", now.anysuccess);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: /* STATE 79 - 1:62 - [quorumsuccess = (quorumsuccess-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		(trpt+1)->bup.oval = now.quorumsuccess;
		now.quorumsuccess = (now.quorumsuccess-1);
#ifdef VAR_RANGES
		logval("quorumsuccess", now.quorumsuccess);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: /* STATE 81 - 1:63 - [anysuccess = anysuccess] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][81] = 1;
		(trpt+1)->bup.oval = now.anysuccess;
		now.anysuccess = now.anysuccess;
#ifdef VAR_RANGES
		logval("anysuccess", now.anysuccess);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: /* STATE 87 - 1:66 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][87] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

