(("undefined"!=typeof self?self:global).webpackChunkopen=("undefined"!=typeof self?self:global).webpackChunkopen||[]).push([[296],{82e3:(e,s,a)=>{"use strict";a.d(s,{o:()=>d});var t=a(27378),n=a.n(t),i=a(60564),l=a(7593),c=a(3465),o=a(32801),r=a(61043);const d=n().memo((({uri:e})=>n().createElement(l.ZP,{value:"generic"},n().createElement(i.v,null,n().createElement(o.q,{divider:"before"},n().createElement(c.Jx,{uri:e,displayText:r.ag.get("context-menu.copy-generic-link")}),n().createElement(c.NN,{uri:e}))))))},74296:(e,s,a)=>{"use strict";a.r(s),a.d(s,{SocialListeningCard:()=>V});a(23615);var t=a(27378),n=a.n(t),i=a(79308),l=a(53177),c=a(61043),o=a(66917),r=a.n(o),d=a(35415),m=a(57615);const g="x-socialListeningCard-container",_="x-socialListeningCard-headerTitle",u="x-socialListeningCard-descriptionText",f="x-socialListeningCard-betaLabel",b="x-socialListeningCard-privacyDisclaimer",v="x-socialListeningCard-inviteButton",p="x-socialListeningCard-inviteMoreFriendsMessage";var E=a(30245),h=a(34514),y=a(21483);const w="x-socialListeningAvatar-container",N="x-socialListeningAvatar-initialsFallback";function x({username:e="",displayName:s="",imageUrl:a,typeVariant:t=l.Dy.balladBold}){return n().createElement("div",{className:w},n().createElement(y.E,{src:a,alt:s,loading:"eager"},n().createElement(l.Dy.span,{className:N,variant:t,style:{backgroundColor:L(e)}},Array.from(s)[0])))}function L(e){const s=[h.salmon,h.electricSeafoam,h.azure,h.lavender,h.orange,h.bole];return s[(e.length||0)%s.length]}const D="x-socialListeningParticipant-container",S="x-socialListeningParticipant-avatar",k="x-socialListeningParticipant-name",U="x-socialListeningParticipant-leaveButton";function B({username:e,displayName:s,imageUrl:a,shouldShowLeaveButton:t,isHost:i,onLeave:l}){const o=r().profileURI(e).toURI(),d=i?c.ag.get("social_listening.session_view_delete_session_button_title_text"):c.ag.get("social_listening.session_view_leave_session_button_title_text");return n().createElement("div",{className:D},n().createElement("div",{className:S},n().createElement(x,{username:e,displayName:s,imageUrl:a})),n().createElement(E.r,{className:`${k} ellipsis-one-line`,to:o},s),t&&n().createElement("button",{className:U,onClick:l,"aria-label":d,title:d},n().createElement("svg",{xmlns:"http://www.w3.org/2000/svg",width:"20",height:"20",fill:"none",viewBox:"0 0 20 20"},n().createElement("path",{fill:"currentColor",d:"M16.962 3.627l-.59-.588L10 9.411 3.627 3.039l-.588.588L9.411 10l-6.372 6.372.588.59L10 10.589l6.372 6.373.59-.59L10.589 10l6.373-6.373z"}))))}var C=a(53089),H=a(50760),I=a(27599),z=a(82e3);const R=({socialListening:{session:e,isLoading:s,hasSubscribed:a,error:t}={},onlineStatus:{online:n}={}})=>({session:e,isLoading:s,hasSubscribed:a,error:t,isOnline:n});function V({isVisible:e}){var s;const a=(0,i.I0)(),{session:o,isLoading:E,hasSubscribed:h,error:y,isOnline:w}=(0,i.v9)(R);(0,t.useEffect)((()=>{h||a((0,m.Q0)())}),[a,h]),(0,t.useEffect)((()=>{w&&e&&a((0,m.$B)())}),[a,w,e]);const N=(0,C.W6)(H.ZD);if(!w)return null;const x=(null==o||null===(s=o.participants)||void 0===s?void 0:s.length)||0,L=x===N,{isSessionOwner:D,hasNonHostParticipants:S,participants:k=[],joinSessionToken:U}=o||{},V=y&&!E,O=c.ag.get("social_listening.session_view_failed_to_load"),$=S?c.ag.get("social_listening.session_view_active_session_description_text"):c.ag.get("social_listening.session_view_description_text");return n().createElement("div",{className:g},n().createElement(l.Dy.span,{className:_,variant:l.Dy.balladBold},c.ag.get("social_listening.session_view_header_title"),n().createElement(l.Dy.span,{className:f,variant:l.Dy.minuetBold},c.ag.get("social_listening.session_beta_label"))),n().createElement(l.Dy.p,{className:u,variant:l.Dy.mesto},V?n().createElement("span",{role:"alert"},O):$),V&&n().createElement(d.z,{version:"outlined",onClick:m.$B},c.ag.get("social_listening.session_view_try_again_button_title_text")),!V&&k.map((({username:e,displayName:s,imageUrl:t,isHost:i,isCurrentUser:l})=>n().createElement(B,{key:e,username:e,displayName:s,imageUrl:t,isHost:i,shouldShowLeaveButton:!(!l||!S),onLeave:()=>a((0,m.A0)())}))),!V&&D&&!L&&n().createElement(I.y,{menu:n().createElement(z.o,{uri:r().socialSessionURI(U).toURI()})},n().createElement("button",{className:v,title:c.ag.get("social_listening.invite_button_text"),"aria-label":c.ag.get("social_listening.invite_button_text")},n().createElement("svg",{xmlns:"http://www.w3.org/2000/svg",width:"19",height:"19",fill:"none",viewBox:"0 0 19 19"},n().createElement("path",{fill:"currentColor",d:"M10 9V0h-.999v9H0v1h9.001v9H10v-9h9V9h-9z"})))),n().createElement(l.Dy.p,{variant:l.Dy.finale,className:b},D&&!L&&n().createElement("span",{className:p},c.ag.get("social_listening.invite_title",N-x),".")," ",c.ag.get("social_listening.privacy_disclaimer")))}}}]);