<!-- CONTENT START -->
{if $searchresult_tooShort}
    <div class="post">
        <h1 class="title">{$CONST.QUICKSEARCH}</h1>
        <div class="entry serendipity_search_tooshort">{$content_message}</div>
        <div class="bgbottom" style="clear: both;"></div>
    </div>
{elseif $searchresult_error}
    <div class="post">
        <h1 class="title">{$CONST.QUICKSEARCH}</h1>
        <div class="entry serendipity_search_error">{$content_message}</div>
        <div class="bgbottom" style="clear: both;"></div>
    </div>
{elseif $searchresult_noEntries}
    <div class="post">
        <h1 class="title">{$CONST.QUICKSEARCH}</h1>
        <div class="entry serendipity_search_noentries">{$content_message}</div>
        <div class="bgbottom" style="clear: both;"></div>
    </div>
{elseif $searchresult_results}
    <div class="post">
        <h1 class="title">{$CONST.QUICKSEARCH}</h1>
        <div class="entry serendipity_search_results">{$content_message}</div>
        <div class="bgbottom" style="clear: both;"></div>
    </div>
{else}
    <div class="serendipity_content_message">{$content_message}</div>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
