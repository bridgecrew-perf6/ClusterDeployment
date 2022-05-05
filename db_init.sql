-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION archie;
-- public.profile definition

-- Drop table

-- DROP TABLE public.profile;

CREATE TABLE public.profile (
	profile_id int4 NOT NULL,
	coverimgurl text NULL,
	email text NOT NULL,
	first_name text NOT NULL,
	imgurl text NULL,
	last_name text NOT NULL,
	passkey text NOT NULL,
	username text NOT NULL,
	verification bool NOT NULL,
	CONSTRAINT profile_pkey PRIMARY KEY (profile_id),
	CONSTRAINT uk_5em4hwqp4woqsf49dru7fjo80 UNIQUE (username),
	CONSTRAINT uk_9d5dpsf2ufa6rjbi3y0elkdcd UNIQUE (email),
	CONSTRAINT uk_rtnbkpcqhx0igfslf4ulst291 UNIQUE (passkey)
);


-- public."groups" definition

-- Drop table

-- DROP TABLE public."groups";

CREATE TABLE public."groups" (
	group_id int4 NOT NULL,
	group_coverimgurl text NULL,
	description text NULL,
	group_name varchar(255) NOT NULL,
	group_imgurl text NULL,
	owner_profile_id int4 NULL,
	CONSTRAINT groups_pkey PRIMARY KEY (group_id),
	CONSTRAINT uk_7o859iyhxd19rv4hywgdvu2v4 UNIQUE (group_name),
	CONSTRAINT fkcjbcr9le8pbsn4g9n2tlsqc1i FOREIGN KEY (owner_profile_id) REFERENCES public.profile(profile_id)
);


-- public.post definition

-- Drop table

-- DROP TABLE public.post;

CREATE TABLE public.post (
	post_id int4 NOT NULL,
	body varchar(255) NULL,
	date_posted timestamp NOT NULL,
	image_url text NULL,
	profile_id int4 NOT NULL,
	group_group_id int4 NULL,
	CONSTRAINT post_pkey PRIMARY KEY (post_id),
	CONSTRAINT fk7w3srtaelb1chbm2n8dq0qw0t FOREIGN KEY (group_group_id) REFERENCES public."groups"(group_id),
	CONSTRAINT fkk5e5q6qsbobb7sst3h99kjr50 FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id)
);


-- public.profile_following definition

-- Drop table

-- DROP TABLE public.profile_following;

CREATE TABLE public.profile_following (
	profile_profile_id int4 NOT NULL,
	following_profile_id int4 NOT NULL,
	CONSTRAINT fkf6iwxwtiwh71kk3a4gi5aokpm FOREIGN KEY (following_profile_id) REFERENCES public.profile(profile_id),
	CONSTRAINT fktpbs55pr8qtqbbcev8cwb8o94 FOREIGN KEY (profile_profile_id) REFERENCES public.profile(profile_id)
);


-- public.profile_groups definition

-- Drop table

-- DROP TABLE public.profile_groups;

CREATE TABLE public.profile_groups (
	group_id int4 NOT NULL,
	profile_id int4 NOT NULL,
	CONSTRAINT profile_groups_pkey PRIMARY KEY (group_id, profile_id),
	CONSTRAINT fkgkmoa84fl7jr0nw0tvda6n275 FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id),
	CONSTRAINT fkmmq0byimt01gcklmy2j0y5v15 FOREIGN KEY (group_id) REFERENCES public."groups"(group_id)
);


-- public.bookmark definition

-- Drop table

-- DROP TABLE public.bookmark;

CREATE TABLE public.bookmark (
	bookmark_id int4 NOT NULL,
	post_id int4 NOT NULL,
	profile_id int4 NOT NULL,
	CONSTRAINT bookmark_pkey PRIMARY KEY (bookmark_id),
	CONSTRAINT fkbrwfrudp6lu69r0ah11u0taqn FOREIGN KEY (profile_id) REFERENCES public.profile(profile_id),
	CONSTRAINT fkkm47dr0i09mor5ks9aaebx15u FOREIGN KEY (post_id) REFERENCES public.post(post_id)
);


-- public.bookmarks definition

-- Drop table

-- DROP TABLE public.bookmarks;

CREATE TABLE public.bookmarks (
	post_id int4 NOT NULL,
	profile_id int4 NULL,
	CONSTRAINT fkev5rgtdb3inrh0kbekcxuoahl FOREIGN KEY (post_id) REFERENCES public.post(post_id)
);


-- public."comment" definition

-- Drop table

-- DROP TABLE public."comment";

CREATE TABLE public."comment" (
	cid int4 NOT NULL,
	cbody varchar(255) NULL,
	date_created timestamp NULL,
	post_post_id int4 NULL,
	previous_cid int4 NULL,
	writer_profile_id int4 NULL,
	CONSTRAINT comment_pkey PRIMARY KEY (cid),
	CONSTRAINT fk5npaom23mdrrh5oc0rwkdq91b FOREIGN KEY (writer_profile_id) REFERENCES public.profile(profile_id),
	CONSTRAINT fkempgdgjmj0ki1n5jamn9jt28o FOREIGN KEY (previous_cid) REFERENCES public."comment"(cid),
	CONSTRAINT fkl8nbwgv77jgcnpgklda5ajghi FOREIGN KEY (post_post_id) REFERENCES public.post(post_id)
);


-- public.likes definition

-- Drop table

-- DROP TABLE public.likes;

CREATE TABLE public.likes (
	post_id int4 NOT NULL,
	profile_id int4 NULL,
	CONSTRAINT fkowd6f4s7x9f3w50pvlo6x3b41 FOREIGN KEY (post_id) REFERENCES public.post(post_id)
);


-- public.notification definition

-- Drop table

-- DROP TABLE public.notification;

CREATE TABLE public.notification (
	nid int4 NOT NULL,
	is_read bool NULL,
	cid int4 NULL,
	from_profile_id int4 NULL,
	post_id int4 NULL,
	to_profile_id int4 NULL,
	CONSTRAINT notification_pkey PRIMARY KEY (nid),
	CONSTRAINT fk1j1d7fi8by2jvx0ocsh4elqi7 FOREIGN KEY (cid) REFERENCES public."comment"(cid),
	CONSTRAINT fkfa4e8fq4uo1gplxi0tbef5h31 FOREIGN KEY (to_profile_id) REFERENCES public.profile(profile_id),
	CONSTRAINT fkn1l10g2mvj4r1qs93k952fshe FOREIGN KEY (post_id) REFERENCES public.post(post_id),
	CONSTRAINT fkspmut4h6ay3lv8x965vp2rjqk FOREIGN KEY (from_profile_id) REFERENCES public.profile(profile_id)
);
