% debug1.m

      fprintf(dbgfile, '%84s\n',...
              ' ------------------after dpper : ---------------- ');
      fprintf(dbgfile, '    inputs : \n');
      fprintf(dbgfile,...
              '%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f\n',...
              'e3', e3, 'ee2', ee2, 'peo', peo, 'pgho', pgho,...
              'pho', pho, 'pinco', pinco);
      fprintf(dbgfile,...
              '%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f\n',...
              'plo', plo, 'se2', se2, 'se3', se3, 'sgh2', sgh2,...
              'sgh3', sgh3, 'sgh4', sgh4);
      fprintf(dbgfile,...
              '%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f\n',...
              'sh2', sh2, 'sh3', sh3, 'si2', si2, 'si3', si3,...
              'sl2', sl2, 'sl3', sl3);
      fprintf(dbgfile,...
              '%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f\n',...
              'sl4', sl4, 't', t, 'xgh2', xgh2, 'xgh3', xgh3,...
              'xgh4', xgh4, 'xh2', xh2);
      fprintf(dbgfile,...
              '%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f\n',...
              'xh3', xh3, 'xi2', xi2, 'xi3', xi3, 'xl2', xl2,...
              'xl3', xl3, 'xl4', xl4);
      fprintf(dbgfile,...
              '%7s%15.9f%7s%15.9f%7s%15s\n',...
              'zmol', zmol, 'zmos', zmos, 'init', init);
      fprintf(dbgfile,  '    in/out : \n');
      fprintf(dbgfile,...
              '%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f%7s%15.9f\n',...
          'ep', ep, 'inclp', inclp, 'nodep', nodep, 'argpp', argpp, 'mp', mp);
