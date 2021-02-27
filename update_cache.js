// Taken from https://code-examples.net/en/q/1d575e

function checkForUpdate()
{
    if (window.applicationCache != undefined && window.applicationCache != null)
    {
        window.applicationCache.addEventListener('updateready', updateApplication);
    }
}
function updateApplication(event)
{
    if (window.applicationCache.status != 4) return;
    window.applicationCache.removeEventListener('updateready', updateApplication);
    window.applicationCache.swapCache();
    window.location.reload();
}