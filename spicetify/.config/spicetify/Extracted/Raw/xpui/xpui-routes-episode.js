(("undefined"!=typeof self?self:global).webpackChunkopen=("undefined"!=typeof self?self:global).webpackChunkopen||[]).push([[472],{76105:(e,t,a)=>{"use strict";a.r(t),a.d(t,{Episode:()=>le,MUSIC_PLUS_TALK_TRIGGER_ID:()=>ne,default:()=>ie});var n=a(27378),l=a.n(n),i=a(79308),s=a(41056),r=a(61043),o=a(66917),c=a.n(o),d=a(15941),u=a(71338),m=a(8557),p=a(23301),E=a(60858),g=a(14105);const y="episode-episode-episode",v="episode-episode-contentDescription",f="episode-episode-contentDescriptionTitle";a(23615);var b=a(60042),k=a.n(b),L=a(62062);const h="episode-episodesShelf-EpisodesShelf",_="episode-episodesShelf-Title",I="episode-episodesShelf-EpisodesList";var S=a(53177),P=a(34514);const U=({title:e,episodes:t,className:a})=>l().createElement("div",{className:k()(h,a)},l().createElement(S.Dy,{as:"h2",variant:S.Dy.canon,color:P.white,className:_},e),l().createElement("div",{className:I},t.map((e=>l().createElement(L.B,{key:e.id,entity:e})))));var A=a(52110),M=a(11111),B=a(96415),R=a(40079),w=a(60247),C=a(37539);const N="episode-episodeEntityHeader-container",x="episode-episodeEntityHeader-smallHeader";var D=a(42271),Z=a(34907),z=a(41113),O=a(91030),T=a(19369),$=a(39551),G=a(43031),W=a(81105);const F=e=>{const t=c().from(e);return`/show/${c().hexToId((null==t?void 0:t.id)||"")}`},J=({uri:e,backgroundColor:t,backgroundImages:a,size:i,data:s,playButtonWrapper:r=null,contextMenuWrapper:o=W.j,onPlayClick:c,isPlaying:d,isPlayDisabled:u=!1,playButtonRef:m,actionBarHeader:p,actionBarButtons:E})=>{const g=(0,n.useRef)(null),{imageUrl:y}=(0,R.f)(a,g),{title:v="",subtitle:f="",subtitleLinkURI:b,type:L,displayType:h,images:_}=s;return l().createElement(l().Fragment,null,l().createElement("div",{"data-testid":"container",ref:g,style:{backgroundColor:t},className:k()(C.Z.container,N,C.Z.overlay,{[C.Z.withBackgroundImage]:y,[C.Z.smallHeader]:i===G.f.SMALL,[x]:i===G.f.SMALL})},y&&l().createElement(l().Fragment,null,l().createElement("div",{"data-testid":"background-image",className:k()(C.Z.background,C.Z.gradient),style:{backgroundImage:`url(${y})`}}),l().createElement("div",{className:k()(C.Z.background,C.Z.overlay)})),l().createElement(o,{uri:e,contextUri:e},l().createElement(Z.O,{title:v,className:C.Z.image,size:i===G.f.SMALL?z.m$.SIZE_56:z.m$.SIZE_200,type:L,images:_,shape:Z.K.ROUNDED_CORNERS})),l().createElement(D.sP,null,i!==G.f.SMALL&&l().createElement(S.Dy.p,{variant:S.$e.minuetBold},h),l().createElement(o,{uri:e,contextUri:e},l().createElement(D.xd,{size:i===G.f.SMALL?T.Jj.SMALL:T.Jj.LARGE},v)),l().createElement(D.dy,{small:i===G.f.SMALL,large:i===G.f.LARGE},b&&l().createElement(o,{uri:b,contextUri:e},l().createElement(w.rU,{to:F(b)},f))))),l().createElement(O.o,{backgroundColor:t,size:i===G.f.SMALL?O.m.SMALL:O.m.LARGE,playButton:i===G.f.MOBILE?null:l().createElement("div",{className:C.Z.stickyPlayButton,ref:m},r?r(l().createElement($.JM,{size:$.qE.lg,onClick:c,isPlaying:d,disabled:u})):l().createElement($.JM,{size:$.qE.lg,onClick:c,isPlaying:d,disabled:u})),header:p,secondaryActionButtons:E}))};var j=a(2031),H=a(87126),q=a(76638),K=a(65296),Y=a(53877),Q=a(27599),V=a(82075),X=a(54753),ee=a(82385),te=a(21114);const ae=({children:e,uri:t,contextUri:a})=>l().createElement(te._,{menu:l().createElement(V.k,{uri:t,contextUri:a})},e),ne="activation-trigger-mme",le=e=>{var t,a,s,o,b,k,L,h;const{uri:_}=e,I=(0,i.I0)(),P=(0,M.o)(),R=(0,i.v9)((e=>e.entities.tracks[_])),[w,C]=(0,n.useState)((null==R||null===(t=R.resume_point)||void 0===t?void 0:t.fully_played)||!1),N=(0,i.v9)((e=>{var t,a;return null===(t=e.entities.similarEpisodes)||void 0===t||null===(a=t[_])||void 0===a?void 0:a.map((t=>e.entities.tracks[t]))})),x=(0,i.v9)(B.dO),D=(0,i.v9)(Y.fL),Z=(0,i.v9)(Y.Ys)===_,z=x.isPlaying&&x.trackURI===_,O=null==R||null===(a=R.show)||void 0===a?void 0:a.uri,T=null==R?void 0:R.episodeType,$={displayType:"EPISODE"===(null==R?void 0:R.episodeType)?r.ag.get("type.showEpisode"):r.ag.get("type.podcastEpisode"),title:(null==R?void 0:R.name)||"",subtitle:null==R||null===(s=R.show)||void 0===s?void 0:s.name,subtitleLinkURI:null==R||null===(o=R.show)||void 0===o?void 0:o.uri,images:(null==R?void 0:R.images)||[],type:j.p.EPISODE},W=null==R||null===(b=R.images)||void 0===b||null===(k=b[0])||void 0===k?void 0:k.url,F=(0,ee.Z)(W||null);(0,n.useEffect)((()=>{if(!R)return void I((0,d.N5)(_));const{name:e,show:t}=R;I((0,d.y7)(_)),I((0,d.PA)(O)),I((0,u.Dk)(r.ag.get("podcasts.episode.seo.title",{name:e,show:(null==t?void 0:t.name)||""})))}),[I,R,_,O]);const te=null===(L=(0,i.oR)().getState().platform)||void 0===L?void 0:L.isBrowser,le=(0,n.useCallback)((e=>{const t=parseInt(e,10)||0;let a="play";z&&0===t&&(a="pause"),P({intent:a,targetUri:_,type:"click",itemIdSuffix:t>0?"podcast-description-timestamp":"button"}),T===q.Wf.Episode&&te?m.y.set((()=>({triggerId:ne,triggerAction:null}))):I((0,p.mU)(_,t))}),[I,z,_,P,T,te]),ie=(0,n.useCallback)((()=>{P({intent:"expand-description",type:"click"})}),[P]),se=(0,n.useCallback)((e=>te?l().createElement(K.c,{id:ne,targetURI:c().from(_)},e):e),[_,te]);return R?l().createElement("section",{className:y},l().createElement(J,{uri:R.uri,backgroundColor:F,size:G.f.LARGE,data:$,onPlayClick:le,isPlaying:z,isPlayDisabled:!R.is_playable,playButtonWrapper:se,contextMenuWrapper:ae,actionBarHeader:l().createElement(A.E,{size:A.$.LARGE,fullyPlayed:w,durationMs:R.duration_ms,releaseDate:R.release_date,resumePositionMs:(null==R||null===(h=R.resume_point)||void 0===h?void 0:h.resume_position_ms)||0,isPlaying:z,position:Z?D:void 0}),actionBarButtons:l().createElement(l().Fragment,null,l().createElement(g.p,{uri:R.uri,showUri:O}),l().createElement(Q.y,{menu:l().createElement(V.k,{uri:_,sharingInfo:R.sharingInfo,showUri:O,contextUri:_,isPlayed:w,onMarkAsPlayed:C})},l().createElement(X.z,null)))}),l().createElement("div",{className:"contentSpacing"},R.description&&l().createElement(l().Fragment,null,l().createElement(S.Dy,{as:"h2",variant:S.$e.canon,color:"white",className:f},r.ag.get("episode.description-title")),l().createElement(H.o,{className:v,onTimeStampClick:le,maxLines:4,onExpanded:ie,content:(R.description||"").trim()})),(null==N?void 0:N.length)>0&&l().createElement(U,{title:r.ag.get("mwp.entity.might.like"),episodes:N}))):l().createElement(E.h,{errorMessage:r.ag.get("error.not_found.title.podcast")})},ie=l().memo((()=>{const{episodeId:e}=(0,s.UO)(),t=`spotify:episode:${e}`;return l().createElement(le,{uri:t})}))}}]);