    for (i in 1:npmfs) {
      int j = 0;
      for (k in 1:dmax) {
        j += is_nan(fabs(pmfs[k, i])) ? 1 : 0;
        j += is_inf(fabs(pmfs[k, i])) ? 1 : 0;
      }
      j += phi <= 1e-3 ? 1 : 0;
      if (j) {
        print("Issue with pmf");
        print(i);
        print("Truncation  distribution estimate");
        print(pmfs[, i]);
        print("Logmean and Logsd intercept");
        print(logmean_int);
        if (dist) {
          print(logsd_int);
        }
        print("Logmean and Logsd for pmf");
        print(logmean[i]);
        if (dist) {
          print(logsd[i]);
        }
        print("Unique report day hazards");
        print(srdlh);
        print("Overdispersion");
        print(sqrt_phi);
      }
    }
    int j = 0;
    for (k in 1:urds) {
      j += is_nan(fabs(srdlh[k])) ? 1 : 0;
      j += is_inf(fabs(srdlh[k])) ? 1 : 0;
    }
    if (j) {
      print("Hazard effects on report date");
      print(srdlh);
    }
