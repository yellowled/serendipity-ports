<!-- CONTENT START -->
{if $searchresult_tooShort}
    <h3>{$CONST.QUICKSEARCH}</h3>
    <p class="serendipity_search serendipity_search_tooshort">{$content_message}</p>
{elseif $searchresult_error}
    <h3>{$CONST.QUICKSEARCH}</h3>
    <p class="serendipity_search serendipity_search_error">{$content_message}</p>
{elseif $searchresult_noEntries}
    <h3>{$CONST.QUICKSEARCH}</h3>
    <p class="serendipity_search serendipity_search_noentries">{$content_message}</p>
{elseif $searchresult_results}
    <h3>{$CONST.QUICKSEARCH}</h3>
    <p class="serendipity_search serendipity_search_results">{$content_message}</p>
{else}
    <p class="serendipity_content_message">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
