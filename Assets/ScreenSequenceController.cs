using UnityEngine;
using UnityEngine.Playables;

public class SequenceUIController : MonoBehaviour
{
    [Header("Canvas")]
    public Canvas canvas;

    [Header("Cameras")]
    [Tooltip("Always enabled as the base game view.")]
    public Camera gameCamera;

    [Tooltip("Optional overlay cameras. These can be disabled by default.")]
    public Camera matchFoundCamera;
    public Camera victoryCamera;
    public Camera defeatCamera;

    [Header("Timeline Directors")]
    public PlayableDirector matchFoundDirector;
    public PlayableDirector victoryDirector;
    public PlayableDirector defeatDirector;

    [Header("UI")]
    [Tooltip("Assign ALL buttons that should be hidden when any action starts (including the action buttons and reset if you want).")]
    public GameObject[] buttonsToToggle;

    [Tooltip("If true, directors will be snapped to frame 0 at Start (without playing).")]
    public bool evaluateOnStart = false;

    void Start()
    {
        canvas.gameObject.SetActive(true);

        // Game camera should always be enabled
        if (gameCamera)
        {
            gameCamera.gameObject.SetActive(true);
            gameCamera.enabled = true;
        }

        // Ensure overlay cameras are off initially (optional)
        SetOverlayCamerasOff();

        // Ensure directors don't autoplay
        PrepDirector(matchFoundDirector);
        PrepDirector(victoryDirector);
        PrepDirector(defeatDirector);

        // Ensure buttons are visible at start
        ShowAllButtons();
    }

    void PrepDirector(PlayableDirector d)
    {
        if (!d) return;

        d.playOnAwake = false;
        d.Stop();

        if (evaluateOnStart)
        {
            d.time = 0;
            d.Evaluate();
        }
    }

    void StopAllDirectors()
    {
        if (matchFoundDirector) matchFoundDirector.Stop();
        if (victoryDirector) victoryDirector.Stop();
        if (defeatDirector) defeatDirector.Stop();
    }

    void PlayDirectorFromStart(PlayableDirector d)
    {
        if (!d) return;
        d.time = 0;
        d.Evaluate(); // snap to first frame before playing
        d.Play();
    }

    void SetOverlayCamerasOff()
    {
        if (matchFoundCamera) matchFoundCamera.gameObject.SetActive(false);
        if (victoryCamera) victoryCamera.gameObject.SetActive(false);
        if (defeatCamera) defeatCamera.gameObject.SetActive(false);
    }

    void EnableOverlayCamera(Camera cam)
    {
        // Turn all overlay cams off, then enable target cam
        SetOverlayCamerasOff();
        if (!cam) return;

        cam.gameObject.SetActive(true);
        cam.enabled = true;
    }

    void HideAllButtons()
    {
        if (buttonsToToggle == null) return;
        foreach (var go in buttonsToToggle)
        {
            if (go) go.SetActive(false);
        }
    }

    void ShowAllButtons()
    {
        if (buttonsToToggle == null) return;
        foreach (var go in buttonsToToggle)
        {
            if (go) go.SetActive(true);
        }
    }

    // -------------------------
    // UI Button Hooks (¼½©ñ)
    // -------------------------

    public void ShowMatchFound()
    {
        HideAllButtons();

        StopAllDirectors();
        EnableOverlayCamera(matchFoundCamera);
        PlayDirectorFromStart(matchFoundDirector);
    }

    public void ShowVictory()
    {
        HideAllButtons();

        StopAllDirectors();
        EnableOverlayCamera(victoryCamera);
        PlayDirectorFromStart(victoryDirector);
    }

    public void ShowDefeat()
    {
        HideAllButtons();

        StopAllDirectors();
        EnableOverlayCamera(defeatCamera);
        PlayDirectorFromStart(defeatDirector);
    }

    // -------------------------
    // UI Button Hook (­«¸m)
    // -------------------------

    public void ResetAll()
    {
        // Stop animations
        StopAllDirectors();

        // Turn off overlay cameras (Game camera stays on)
        SetOverlayCamerasOff();

        // Show buttons again
        ShowAllButtons();
    }
}