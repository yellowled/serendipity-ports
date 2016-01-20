<!-- CONTENT START -->
{if $searchresult_tooShort}
    <h1 class="btmspace">{$CONST.QUICKSEARCH}</h1>
    <p class="serendipity_search_tooshort">{$content_message}</p>
{elseif $searchresult_error}
    <h1 class="btmspace">{$CONST.QUICKSEARCH}</h1>
    <p class="serendipity_search_error">{$content_message}</p>
{elseif $searchresult_noEntries}
    <h1 class="btmspace">{$CONST.QUICKSEARCH}</h1>
    <p class="serendipity_search_noentries">{$content_message}</p>
{elseif $searchresult_results}
    <h1 class="btmspace">{$CONST.QUICKSEARCH}</h1>
    <p class="serendipity_search_results">{$content_message}</p>
{else}
    <p class="serendipity_content_message">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
