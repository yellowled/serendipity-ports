<!-- RECENT ENTRIES START -->
{assign var="oxrecposts" value=$CONST.OX_RECENT_POSTS}
{assign var="oxreadmore" value=$CONST.OX_READ_MORE}
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
<h2>{$oxrecposts}</h2>
<ul>
{foreach from=$entries item="dategroup"}
{foreach from=$dategroup.entries item="entry"}
   <li><h3 class="title"><a href="{$entry.link}" rel="bookmark">{$entry.title}</a>{if $dategroup.is_sticky} ({$CONST.STICKY_POSTINGS}){/if}</h3>

       <p class="meta"><small class="author">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a></small> <small class="date">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</small></p>

       {$entry.body|truncate:300}&nbsp;<a href="{$entry.link}" rel="bookmark">{$oxreadmore}</a>
   </li>
{/foreach}
{/foreach}
</ul>
{serendipity_hookPlugin hook="entries_footer"}
<!-- RECENT ENTRIES END -->
