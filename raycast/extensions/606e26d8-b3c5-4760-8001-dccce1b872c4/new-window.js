"use strict";var mn=Object.create;var B=Object.defineProperty;var hn=Object.getOwnPropertyDescriptor;var wn=Object.getOwnPropertyNames;var xn=Object.getPrototypeOf,Sn=Object.prototype.hasOwnProperty;var c=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),gn=(e,t)=>{for(var r in t)B(e,r,{get:t[r],enumerable:!0})},_e=(e,t,r,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let o of wn(t))!Sn.call(e,o)&&o!==r&&B(e,o,{get:()=>t[o],enumerable:!(n=hn(t,o))||n.enumerable});return e};var ve=(e,t,r)=>(r=e!=null?mn(xn(e)):{},_e(t||!e||!e.__esModule?B(r,"default",{value:e,enumerable:!0}):r,e)),yn=e=>_e(B({},"__esModule",{value:!0}),e);var Pe=c((xo,Ae)=>{Ae.exports=Te;Te.sync=_n;var Ie=require("fs");function bn(e,t){var r=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!r||(r=r.split(";"),r.indexOf("")!==-1))return!0;for(var n=0;n<r.length;n++){var o=r[n].toLowerCase();if(o&&e.substr(-o.length).toLowerCase()===o)return!0}return!1}function Ee(e,t,r){return!e.isSymbolicLink()&&!e.isFile()?!1:bn(t,r)}function Te(e,t,r){Ie.stat(e,function(n,o){r(n,n?!1:Ee(o,e,t))})}function _n(e,t){return Ee(Ie.statSync(e),e,t)}});var Ne=c((So,Oe)=>{Oe.exports=Ce;Ce.sync=vn;var Ge=require("fs");function Ce(e,t,r){Ge.stat(e,function(n,o){r(n,n?!1:Re(o,t))})}function vn(e,t){return Re(Ge.statSync(e),t)}function Re(e,t){return e.isFile()&&In(e,t)}function In(e,t){var r=e.mode,n=e.uid,o=e.gid,i=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),s=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),u=parseInt("010",8),l=parseInt("001",8),f=a|u,h=r&l||r&u&&o===s||r&a&&n===i||r&f&&i===0;return h}});var $e=c((yo,qe)=>{var go=require("fs"),M;process.platform==="win32"||global.TESTING_WINDOWS?M=Pe():M=Ne();qe.exports=Z;Z.sync=En;function Z(e,t,r){if(typeof t=="function"&&(r=t,t={}),!r){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(n,o){Z(e,t||{},function(i,s){i?o(i):n(s)})})}M(e,t||{},function(n,o){n&&(n.code==="EACCES"||t&&t.ignoreErrors)&&(n=null,o=!1),r(n,o)})}function En(e,t){try{return M.sync(e,t||{})}catch(r){if(t&&t.ignoreErrors||r.code==="EACCES")return!1;throw r}}});var Fe=c((bo,Ue)=>{var v=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",ke=require("path"),Tn=v?";":":",Le=$e(),Be=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),Me=(e,t)=>{let r=t.colon||Tn,n=e.match(/\//)||v&&e.match(/\\/)?[""]:[...v?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(r)],o=v?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",i=v?o.split(r):[""];return v&&e.indexOf(".")!==-1&&i[0]!==""&&i.unshift(""),{pathEnv:n,pathExt:i,pathExtExe:o}},je=(e,t,r)=>{typeof t=="function"&&(r=t,t={}),t||(t={});let{pathEnv:n,pathExt:o,pathExtExe:i}=Me(e,t),s=[],a=l=>new Promise((f,h)=>{if(l===n.length)return t.all&&s.length?f(s):h(Be(e));let m=n[l],w=/^".*"$/.test(m)?m.slice(1,-1):m,x=ke.join(w,e),S=!w&&/^\.[\\\/]/.test(e)?e.slice(0,2)+x:x;f(u(S,l,0))}),u=(l,f,h)=>new Promise((m,w)=>{if(h===o.length)return m(a(f+1));let x=o[h];Le(l+x,{pathExt:i},(S,_)=>{if(!S&&_)if(t.all)s.push(l+x);else return m(l+x);return m(u(l,f,h+1))})});return r?a(0).then(l=>r(null,l),r):a(0)},An=(e,t)=>{t=t||{};let{pathEnv:r,pathExt:n,pathExtExe:o}=Me(e,t),i=[];for(let s=0;s<r.length;s++){let a=r[s],u=/^".*"$/.test(a)?a.slice(1,-1):a,l=ke.join(u,e),f=!u&&/^\.[\\\/]/.test(e)?e.slice(0,2)+l:l;for(let h=0;h<n.length;h++){let m=f+n[h];try{if(Le.sync(m,{pathExt:o}))if(t.all)i.push(m);else return m}catch{}}}if(t.all&&i.length)return i;if(t.nothrow)return null;throw Be(e)};Ue.exports=je;je.sync=An});var te=c((_o,ee)=>{"use strict";var De=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(n=>n.toUpperCase()==="PATH")||"Path"};ee.exports=De;ee.exports.default=De});var Ke=c((vo,Xe)=>{"use strict";var We=require("path"),Pn=Fe(),Gn=te();function He(e,t){let r=e.options.env||process.env,n=process.cwd(),o=e.options.cwd!=null,i=o&&process.chdir!==void 0&&!process.chdir.disabled;if(i)try{process.chdir(e.options.cwd)}catch{}let s;try{s=Pn.sync(e.command,{path:r[Gn({env:r})],pathExt:t?We.delimiter:void 0})}catch{}finally{i&&process.chdir(n)}return s&&(s=We.resolve(o?e.options.cwd:"",s)),s}function Cn(e){return He(e)||He(e,!0)}Xe.exports=Cn});var ze=c((Io,re)=>{"use strict";var ne=/([()\][%!^"`<>&|;, *?])/g;function Rn(e){return e=e.replace(ne,"^$1"),e}function On(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(ne,"^$1"),t&&(e=e.replace(ne,"^$1")),e}re.exports.command=Rn;re.exports.argument=On});var Ye=c((Eo,Ve)=>{"use strict";Ve.exports=/^#!(.*)/});var Qe=c((To,Je)=>{"use strict";var Nn=Ye();Je.exports=(e="")=>{let t=e.match(Nn);if(!t)return null;let[r,n]=t[0].replace(/#! ?/,"").split(" "),o=r.split("/").pop();return o==="env"?n:n?`${o} ${n}`:o}});var et=c((Ao,Ze)=>{"use strict";var oe=require("fs"),qn=Qe();function $n(e){let r=Buffer.alloc(150),n;try{n=oe.openSync(e,"r"),oe.readSync(n,r,0,150,0),oe.closeSync(n)}catch{}return qn(r.toString())}Ze.exports=$n});var ot=c((Po,rt)=>{"use strict";var kn=require("path"),tt=Ke(),nt=ze(),Ln=et(),Bn=process.platform==="win32",Mn=/\.(?:com|exe)$/i,jn=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function Un(e){e.file=tt(e);let t=e.file&&Ln(e.file);return t?(e.args.unshift(e.file),e.command=t,tt(e)):e.file}function Fn(e){if(!Bn)return e;let t=Un(e),r=!Mn.test(t);if(e.options.forceShell||r){let n=jn.test(t);e.command=kn.normalize(e.command),e.command=nt.command(e.command),e.args=e.args.map(i=>nt.argument(i,n));let o=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${o}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Dn(e,t,r){t&&!Array.isArray(t)&&(r=t,t=null),t=t?t.slice(0):[],r=Object.assign({},r);let n={command:e,args:t,options:r,file:void 0,original:{command:e,args:t}};return r.shell?n:Fn(n)}rt.exports=Dn});var at=c((Go,st)=>{"use strict";var ie=process.platform==="win32";function se(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Wn(e,t){if(!ie)return;let r=e.emit;e.emit=function(n,o){if(n==="exit"){let i=it(o,t,"spawn");if(i)return r.call(e,"error",i)}return r.apply(e,arguments)}}function it(e,t){return ie&&e===1&&!t.file?se(t.original,"spawn"):null}function Hn(e,t){return ie&&e===1&&!t.file?se(t.original,"spawnSync"):null}st.exports={hookChildProcess:Wn,verifyENOENT:it,verifyENOENTSync:Hn,notFoundError:se}});var lt=c((Co,I)=>{"use strict";var ct=require("child_process"),ae=ot(),ce=at();function ut(e,t,r){let n=ae(e,t,r),o=ct.spawn(n.command,n.args,n.options);return ce.hookChildProcess(o,n),o}function Xn(e,t,r){let n=ae(e,t,r),o=ct.spawnSync(n.command,n.args,n.options);return o.error=o.error||ce.verifyENOENTSync(o.status,n),o}I.exports=ut;I.exports.spawn=ut;I.exports.sync=Xn;I.exports._parse=ae;I.exports._enoent=ce});var ft=c((Ro,dt)=>{"use strict";dt.exports=e=>{let t=typeof e=="string"?`
`:`
`.charCodeAt(),r=typeof e=="string"?"\r":"\r".charCodeAt();return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===r&&(e=e.slice(0,e.length-1)),e}});var ht=c((Oo,O)=>{"use strict";var R=require("path"),pt=te(),mt=e=>{e={cwd:process.cwd(),path:process.env[pt()],execPath:process.execPath,...e};let t,r=R.resolve(e.cwd),n=[];for(;t!==r;)n.push(R.join(r,"node_modules/.bin")),t=r,r=R.resolve(r,"..");let o=R.resolve(e.cwd,e.execPath,"..");return n.push(o),n.concat(e.path).join(R.delimiter)};O.exports=mt;O.exports.default=mt;O.exports.env=e=>{e={env:process.env,...e};let t={...e.env},r=pt({env:t});return e.path=t[r],t[r]=O.exports(e),t}});var xt=c((No,ue)=>{"use strict";var wt=(e,t)=>{for(let r of Reflect.ownKeys(t))Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(t,r));return e};ue.exports=wt;ue.exports.default=wt});var gt=c((qo,U)=>{"use strict";var Kn=xt(),j=new WeakMap,St=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let r,n=0,o=e.displayName||e.name||"<anonymous>",i=function(...s){if(j.set(i,++n),n===1)r=e.apply(this,s),e=null;else if(t.throw===!0)throw new Error(`Function \`${o}\` can only be called once`);return r};return Kn(i,e),j.set(i,n),i};U.exports=St;U.exports.default=St;U.exports.callCount=e=>{if(!j.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return j.get(e)}});var yt=c(F=>{"use strict";Object.defineProperty(F,"__esModule",{value:!0});F.SIGNALS=void 0;var zn=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];F.SIGNALS=zn});var le=c(E=>{"use strict";Object.defineProperty(E,"__esModule",{value:!0});E.SIGRTMAX=E.getRealtimeSignals=void 0;var Vn=function(){let e=_t-bt+1;return Array.from({length:e},Yn)};E.getRealtimeSignals=Vn;var Yn=function(e,t){return{name:`SIGRT${t+1}`,number:bt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},bt=34,_t=64;E.SIGRTMAX=_t});var vt=c(D=>{"use strict";Object.defineProperty(D,"__esModule",{value:!0});D.getSignals=void 0;var Jn=require("os"),Qn=yt(),Zn=le(),er=function(){let e=(0,Zn.getRealtimeSignals)();return[...Qn.SIGNALS,...e].map(tr)};D.getSignals=er;var tr=function({name:e,number:t,description:r,action:n,forced:o=!1,standard:i}){let{signals:{[e]:s}}=Jn.constants,a=s!==void 0;return{name:e,number:a?s:t,description:r,supported:a,action:n,forced:o,standard:i}}});var Et=c(T=>{"use strict";Object.defineProperty(T,"__esModule",{value:!0});T.signalsByNumber=T.signalsByName=void 0;var nr=require("os"),It=vt(),rr=le(),or=function(){return(0,It.getSignals)().reduce(ir,{})},ir=function(e,{name:t,number:r,description:n,supported:o,action:i,forced:s,standard:a}){return{...e,[t]:{name:t,number:r,description:n,supported:o,action:i,forced:s,standard:a}}},sr=or();T.signalsByName=sr;var ar=function(){let e=(0,It.getSignals)(),t=rr.SIGRTMAX+1,r=Array.from({length:t},(n,o)=>cr(o,e));return Object.assign({},...r)},cr=function(e,t){let r=ur(e,t);if(r===void 0)return{};let{name:n,description:o,supported:i,action:s,forced:a,standard:u}=r;return{[e]:{name:n,number:e,description:o,supported:i,action:s,forced:a,standard:u}}},ur=function(e,t){let r=t.find(({name:n})=>nr.constants.signals[n]===e);return r!==void 0?r:t.find(n=>n.number===e)},lr=ar();T.signalsByNumber=lr});var At=c((Mo,Tt)=>{"use strict";var{signalsByName:dr}=Et(),fr=({timedOut:e,timeout:t,errorCode:r,signal:n,signalDescription:o,exitCode:i,isCanceled:s})=>e?`timed out after ${t} milliseconds`:s?"was canceled":r!==void 0?`failed with ${r}`:n!==void 0?`was killed with ${n} (${o})`:i!==void 0?`failed with exit code ${i}`:"failed",pr=({stdout:e,stderr:t,all:r,error:n,signal:o,exitCode:i,command:s,escapedCommand:a,timedOut:u,isCanceled:l,killed:f,parsed:{options:{timeout:h}}})=>{i=i===null?void 0:i,o=o===null?void 0:o;let m=o===void 0?void 0:dr[o].description,w=n&&n.code,S=`Command ${fr({timedOut:u,timeout:h,errorCode:w,signal:o,signalDescription:m,exitCode:i,isCanceled:l})}: ${s}`,_=Object.prototype.toString.call(n)==="[object Error]",k=_?`${S}
${n.message}`:S,L=[k,t,e].filter(Boolean).join(`
`);return _?(n.originalMessage=n.message,n.message=L):n=new Error(L),n.shortMessage=k,n.command=s,n.escapedCommand=a,n.exitCode=i,n.signal=o,n.signalDescription=m,n.stdout=e,n.stderr=t,r!==void 0&&(n.all=r),"bufferedData"in n&&delete n.bufferedData,n.failed=!0,n.timedOut=Boolean(u),n.isCanceled=l,n.killed=f&&!u,n};Tt.exports=pr});var Gt=c((jo,de)=>{"use strict";var W=["stdin","stdout","stderr"],mr=e=>W.some(t=>e[t]!==void 0),Pt=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return W.map(n=>e[n]);if(mr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${W.map(n=>`\`${n}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let r=Math.max(t.length,W.length);return Array.from({length:r},(n,o)=>t[o])};de.exports=Pt;de.exports.node=e=>{let t=Pt(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var Ct=c((Uo,H)=>{H.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&H.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&H.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var $t=c((Fo,G)=>{var d=global.process,y=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};y(d)?(Rt=require("assert"),A=Ct(),Ot=/^win/i.test(d.platform),N=require("events"),typeof N!="function"&&(N=N.EventEmitter),d.__signal_exit_emitter__?p=d.__signal_exit_emitter__:(p=d.__signal_exit_emitter__=new N,p.count=0,p.emitted={}),p.infinite||(p.setMaxListeners(1/0),p.infinite=!0),G.exports=function(e,t){if(!y(global.process))return function(){};Rt.equal(typeof e,"function","a callback must be provided for exit handler"),P===!1&&fe();var r="exit";t&&t.alwaysLast&&(r="afterexit");var n=function(){p.removeListener(r,e),p.listeners("exit").length===0&&p.listeners("afterexit").length===0&&X()};return p.on(r,e),n},X=function(){!P||!y(global.process)||(P=!1,A.forEach(function(t){try{d.removeListener(t,K[t])}catch{}}),d.emit=z,d.reallyExit=pe,p.count-=1)},G.exports.unload=X,b=function(t,r,n){p.emitted[t]||(p.emitted[t]=!0,p.emit(t,r,n))},K={},A.forEach(function(e){K[e]=function(){if(!!y(global.process)){var r=d.listeners(e);r.length===p.count&&(X(),b("exit",null,e),b("afterexit",null,e),Ot&&e==="SIGHUP"&&(e="SIGINT"),d.kill(d.pid,e))}}}),G.exports.signals=function(){return A},P=!1,fe=function(){P||!y(global.process)||(P=!0,p.count+=1,A=A.filter(function(t){try{return d.on(t,K[t]),!0}catch{return!1}}),d.emit=qt,d.reallyExit=Nt)},G.exports.load=fe,pe=d.reallyExit,Nt=function(t){!y(global.process)||(d.exitCode=t||0,b("exit",d.exitCode,null),b("afterexit",d.exitCode,null),pe.call(d,d.exitCode))},z=d.emit,qt=function(t,r){if(t==="exit"&&y(global.process)){r!==void 0&&(d.exitCode=r);var n=z.apply(this,arguments);return b("exit",d.exitCode,null),b("afterexit",d.exitCode,null),n}else return z.apply(this,arguments)}):G.exports=function(){return function(){}};var Rt,A,Ot,N,p,X,b,K,P,fe,pe,Nt,z,qt});var Lt=c((Do,kt)=>{"use strict";var hr=require("os"),wr=$t(),xr=1e3*5,Sr=(e,t="SIGTERM",r={})=>{let n=e(t);return gr(e,t,r,n),n},gr=(e,t,r,n)=>{if(!yr(t,r,n))return;let o=_r(r),i=setTimeout(()=>{e("SIGKILL")},o);i.unref&&i.unref()},yr=(e,{forceKillAfterTimeout:t},r)=>br(e)&&t!==!1&&r,br=e=>e===hr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",_r=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return xr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},vr=(e,t)=>{e.kill()&&(t.isCanceled=!0)},Ir=(e,t,r)=>{e.kill(t),r(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},Er=(e,{timeout:t,killSignal:r="SIGTERM"},n)=>{if(t===0||t===void 0)return n;let o,i=new Promise((a,u)=>{o=setTimeout(()=>{Ir(e,r,u)},t)}),s=n.finally(()=>{clearTimeout(o)});return Promise.race([i,s])},Tr=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},Ar=async(e,{cleanup:t,detached:r},n)=>{if(!t||r)return n;let o=wr(()=>{e.kill()});return n.finally(()=>{o()})};kt.exports={spawnedKill:Sr,spawnedCancel:vr,setupTimeout:Er,validateTimeout:Tr,setExitHandler:Ar}});var Mt=c((Wo,Bt)=>{"use strict";var g=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";g.writable=e=>g(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";g.readable=e=>g(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";g.duplex=e=>g.writable(e)&&g.readable(e);g.transform=e=>g.duplex(e)&&typeof e._transform=="function";Bt.exports=g});var Ut=c((Ho,jt)=>{"use strict";var{PassThrough:Pr}=require("stream");jt.exports=e=>{e={...e};let{array:t}=e,{encoding:r}=e,n=r==="buffer",o=!1;t?o=!(r||n):r=r||"utf8",n&&(r=null);let i=new Pr({objectMode:o});r&&i.setEncoding(r);let s=0,a=[];return i.on("data",u=>{a.push(u),o?s=a.length:s+=u.length}),i.getBufferedValue=()=>t?a:n?Buffer.concat(a,s):a.join(""),i.getBufferedLength=()=>s,i}});var Ft=c((Xo,q)=>{"use strict";var{constants:Gr}=require("buffer"),Cr=require("stream"),{promisify:Rr}=require("util"),Or=Ut(),Nr=Rr(Cr.pipeline),V=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function me(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:r}=t,n=Or(t);return await new Promise((o,i)=>{let s=a=>{a&&n.getBufferedLength()<=Gr.MAX_LENGTH&&(a.bufferedData=n.getBufferedValue()),i(a)};(async()=>{try{await Nr(e,n),o()}catch(a){s(a)}})(),n.on("data",()=>{n.getBufferedLength()>r&&s(new V)})}),n.getBufferedValue()}q.exports=me;q.exports.buffer=(e,t)=>me(e,{...t,encoding:"buffer"});q.exports.array=(e,t)=>me(e,{...t,array:!0});q.exports.MaxBufferError=V});var Wt=c((Ko,Dt)=>{"use strict";var{PassThrough:qr}=require("stream");Dt.exports=function(){var e=[],t=new qr({objectMode:!0});return t.setMaxListeners(0),t.add=r,t.isEmpty=n,t.on("unpipe",o),Array.prototype.slice.call(arguments).forEach(r),t;function r(i){return Array.isArray(i)?(i.forEach(r),this):(e.push(i),i.once("end",o.bind(null,i)),i.once("error",t.emit.bind(t,"error")),i.pipe(t,{end:!1}),this)}function n(){return e.length==0}function o(i){e=e.filter(function(s){return s!==i}),!e.length&&t.readable&&t.end()}}});var zt=c((zo,Kt)=>{"use strict";var Xt=Mt(),Ht=Ft(),$r=Wt(),kr=(e,t)=>{t===void 0||e.stdin===void 0||(Xt(t)?t.pipe(e.stdin):e.stdin.end(t))},Lr=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let r=$r();return e.stdout&&r.add(e.stdout),e.stderr&&r.add(e.stderr),r},he=async(e,t)=>{if(!!e){e.destroy();try{return await t}catch(r){return r.bufferedData}}},we=(e,{encoding:t,buffer:r,maxBuffer:n})=>{if(!(!e||!r))return t?Ht(e,{encoding:t,maxBuffer:n}):Ht.buffer(e,{maxBuffer:n})},Br=async({stdout:e,stderr:t,all:r},{encoding:n,buffer:o,maxBuffer:i},s)=>{let a=we(e,{encoding:n,buffer:o,maxBuffer:i}),u=we(t,{encoding:n,buffer:o,maxBuffer:i}),l=we(r,{encoding:n,buffer:o,maxBuffer:i*2});try{return await Promise.all([s,a,u,l])}catch(f){return Promise.all([{error:f,signal:f.signal,timedOut:f.timedOut},he(e,a),he(t,u),he(r,l)])}},Mr=({input:e})=>{if(Xt(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};Kt.exports={handleInput:kr,makeAllStream:Lr,getSpawnedResult:Br,validateInputSync:Mr}});var Yt=c((Vo,Vt)=>{"use strict";var jr=(async()=>{})().constructor.prototype,Ur=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(jr,e)]),Fr=(e,t)=>{for(let[r,n]of Ur){let o=typeof t=="function"?(...i)=>Reflect.apply(n.value,t(),i):n.value.bind(t);Reflect.defineProperty(e,r,{...n,value:o})}return e},Dr=e=>new Promise((t,r)=>{e.on("exit",(n,o)=>{t({exitCode:n,signal:o})}),e.on("error",n=>{r(n)}),e.stdin&&e.stdin.on("error",n=>{r(n)})});Vt.exports={mergePromise:Fr,getSpawnedPromise:Dr}});var Zt=c((Yo,Qt)=>{"use strict";var Jt=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],Wr=/^[\w.-]+$/,Hr=/"/g,Xr=e=>typeof e!="string"||Wr.test(e)?e:`"${e.replace(Hr,'\\"')}"`,Kr=(e,t)=>Jt(e,t).join(" "),zr=(e,t)=>Jt(e,t).map(r=>Xr(r)).join(" "),Vr=/ +/g,Yr=e=>{let t=[];for(let r of e.trim().split(Vr)){let n=t[t.length-1];n&&n.endsWith("\\")?t[t.length-1]=`${n.slice(0,-1)} ${r}`:t.push(r)}return t};Qt.exports={joinCommand:Kr,getEscapedCommand:zr,parseCommand:Yr}});var an=c((Jo,C)=>{"use strict";var Jr=require("path"),xe=require("child_process"),Qr=lt(),Zr=ft(),eo=ht(),to=gt(),Y=At(),tn=Gt(),{spawnedKill:no,spawnedCancel:ro,setupTimeout:oo,validateTimeout:io,setExitHandler:so}=Lt(),{handleInput:ao,getSpawnedResult:co,makeAllStream:uo,validateInputSync:lo}=zt(),{mergePromise:en,getSpawnedPromise:fo}=Yt(),{joinCommand:nn,parseCommand:rn,getEscapedCommand:on}=Zt(),po=1e3*1e3*100,mo=({env:e,extendEnv:t,preferLocal:r,localDir:n,execPath:o})=>{let i=t?{...process.env,...e}:e;return r?eo.env({env:i,cwd:n,execPath:o}):i},sn=(e,t,r={})=>{let n=Qr._parse(e,t,r);return e=n.command,t=n.args,r=n.options,r={maxBuffer:po,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:r.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...r},r.env=mo(r),r.stdio=tn(r),process.platform==="win32"&&Jr.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:r,parsed:n}},$=(e,t,r)=>typeof t!="string"&&!Buffer.isBuffer(t)?r===void 0?void 0:"":e.stripFinalNewline?Zr(t):t,J=(e,t,r)=>{let n=sn(e,t,r),o=nn(e,t),i=on(e,t);io(n.options);let s;try{s=xe.spawn(n.file,n.args,n.options)}catch(w){let x=new xe.ChildProcess,S=Promise.reject(Y({error:w,stdout:"",stderr:"",all:"",command:o,escapedCommand:i,parsed:n,timedOut:!1,isCanceled:!1,killed:!1}));return en(x,S)}let a=fo(s),u=oo(s,n.options,a),l=so(s,n.options,u),f={isCanceled:!1};s.kill=no.bind(null,s.kill.bind(s)),s.cancel=ro.bind(null,s,f);let m=to(async()=>{let[{error:w,exitCode:x,signal:S,timedOut:_},k,L,pn]=await co(s,n.options,l),Se=$(n.options,k),ge=$(n.options,L),ye=$(n.options,pn);if(w||x!==0||S!==null){let be=Y({error:w,exitCode:x,signal:S,stdout:Se,stderr:ge,all:ye,command:o,escapedCommand:i,parsed:n,timedOut:_,isCanceled:f.isCanceled,killed:s.killed});if(!n.options.reject)return be;throw be}return{command:o,escapedCommand:i,exitCode:0,stdout:Se,stderr:ge,all:ye,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return ao(s,n.options.input),s.all=uo(s,n.options),en(s,m)};C.exports=J;C.exports.sync=(e,t,r)=>{let n=sn(e,t,r),o=nn(e,t),i=on(e,t);lo(n.options);let s;try{s=xe.spawnSync(n.file,n.args,n.options)}catch(l){throw Y({error:l,stdout:"",stderr:"",all:"",command:o,escapedCommand:i,parsed:n,timedOut:!1,isCanceled:!1,killed:!1})}let a=$(n.options,s.stdout,s.error),u=$(n.options,s.stderr,s.error);if(s.error||s.status!==0||s.signal!==null){let l=Y({stdout:a,stderr:u,error:s.error,signal:s.signal,exitCode:s.status,command:o,escapedCommand:i,parsed:n,timedOut:s.error&&s.error.code==="ETIMEDOUT",isCanceled:!1,killed:s.signal!==null});if(!n.options.reject)return l;throw l}return{command:o,escapedCommand:i,exitCode:0,stdout:a,stderr:u,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};C.exports.command=(e,t)=>{let[r,...n]=rn(e);return J(r,n,t)};C.exports.commandSync=(e,t)=>{let[r,...n]=rn(e);return J.sync(r,n,t)};C.exports.node=(e,t,r={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(r=t,t=[]);let n=tn.node(r),o=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:i=process.execPath,nodeOptions:s=o}=r;return J(i,[...s,e,...Array.isArray(t)?t:[]],{...r,stdin:void 0,stdout:void 0,stderr:void 0,stdio:n,shell:!1})}});var ho={};gn(ho,{default:()=>fn});module.exports=yn(ho);var Q=require("@raycast/api");var cn=ve(require("node:process"),1),un=ve(an(),1);async function ln(e,{humanReadableOutput:t=!0}={}){if(cn.default.platform!=="darwin")throw new Error("macOS only");let r=t?[]:["-ss"],{stdout:n}=await(0,un.default)("osascript",["-e",e,r]);return n}async function dn(e={}){await ln(`
    tell application "Arc"
      make new window with properties {incognito:${e.incognito??!1}}
      activate

      ${e.url?`tell front window to make new tab with properties {URL:"${e.url}"}`:""}
    end tell
  `)}async function fn(){try{await(0,Q.closeMainWindow)(),await dn()}catch{await(0,Q.showHUD)("\u274C Failed opening a new window")}}0&&(module.exports={});
