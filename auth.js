#!/usr/bin/node
var request = require('request'), r, u, rl = require('readline').createInterface({ input:
request.get('https://12id.eu/p/embed$?redirect_uri=http://localhost:80/&client_id=test').on('error', (e) => console.log("error: " + e)) },)
.on('line', (l) => !r ? r = l : !u ? u = l : console.log(l)).on('close', ()=> console.log(r) & (rl=async()=> process.stdout.write('.') &
!(r=await new Promise((r1, r2) => request.get(u, (e, re, b) => e ? r2(e):r1(b)))) ? setTimeout(rl, 1000):console.log("\nR: " + r))());
