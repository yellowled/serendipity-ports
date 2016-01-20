<h2 class="pagetitle">{$plugin_contactform_pagetitle}</h2>
            
<div id="contactpreface">{$plugin_contactform_preface}</div>

{if $is_contactform_sent}
<p class="serendipity_center serendipity_msg_notice">{$plugin_contactform_sent}</p>
{else}
    {if $is_contactform_error}
    <p class="serendipity_center serendipity_msg_important">{$plugin_contactform_error}</p>

    <!-- Needed for Captchas -->
    {foreach from=$comments_messagestack item="message"}
    <div class="serendipity_center serendipity_msg_important">{$message}</div>
    {/foreach}
    {/if}

    <!-- This whole commentform style, including field names is needed for Captchas. The -->
    <!-- spamblock plugin relies on the field names [name], [email], [url], [comment]!   -->

<div class="serendipityCommentForm Comments">
    <a id="serendipity_CommentForm"></a>
    <div class="Form">
    <div class="FormTop"></div>
    <form id="commentform" action="{$commentform_action}#feedback" method="post">
    <div>
    	<input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
	<input type="hidden" name="serendipity[commentform]" value="true" />
    </div>

        <p><label for="author"><small>{$CONST.NAME}</small>
           <input type="text" id="author" name="serendipity[name]" value="{$commentform_name}" class="TextField" style="width: 400px;" />
            </label></p>

        <p><label for="email"><small>{$CONST.EMAIL}</small>
           <input type="text" id="email" name="serendipity[email]" value="{$commentform_email}" class="TextField" style="width: 400px;" />
           </label></p>

        <p><label for="url"><small>{$CONST.HOMEPAGE}</small>
           <input type="text" id="url" name="serendipity[url]" value="{$commentform_url}" class="TextField" style="width: 400px;" />
           </label></p>

        <p><label for="comment"><small>{$CONST.COMMENT}</small>
           <textarea rows="10" cols="10" id="comment" name="serendipity[comment]" class="TextArea" style="width: 400px;">{$commentform_data}</textarea>
           <br />{serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
           </label></p>

        <p><input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /></p>
    </form>
    </div>
</div>
{/if}
