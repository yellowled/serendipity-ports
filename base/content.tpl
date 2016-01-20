<!-- CONTENT START -->
{if $searchresult_tooShort}
    <h3 class="cathead">{$content_message}</h3>
{elseif $searchresult_error}
    <h3 class="cathead">{$content_message}</h3>
{elseif $searchresult_noEntries}
    <h3 class="cathead">{$content_message}</h3>
{elseif $searchresult_results}
    <h3 class="cathead">{$content_message}</h3>
{elseif $content_message}
    <p class="serendipity_content_message">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
