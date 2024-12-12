package com.tist.bean.menu;

import java.util.List;

public class MenuItem {

    private String label;
    private String url;
    private String icon;
    private String largeIcon;
    private boolean selected;
    private List<String> actions;

    public MenuItem() {
    }

    public String getLabel() {
        return this.label;
    }

    public String getUrl() {
        return this.url;
    }

    public String getIcon() {
        return this.icon;
    }

    public String getLargeIcon() {
        return this.largeIcon;
    }

    public boolean isSelected() {
        return this.selected;
    }

    public List<String> getActions() {
        return this.actions;
    }

    public void setLabel(final String label) {
        this.label = label;
    }

    public void setUrl(final String url) {
        this.url = url;
    }

    public void setIcon(final String icon) {
        this.icon = icon;
    }

    public void setLargeIcon(final String largeIcon) {
        this.largeIcon = largeIcon;
    }

    public void setSelected(final boolean selected) {
        this.selected = selected;
    }

    public void setActions(final List<String> actions) {
        this.actions = actions;
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof MenuItem)) {
            return false;
        } else {
            MenuItem other = (MenuItem) o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                Object this$label = this.getLabel();
                Object other$label = other.getLabel();
                if (this$label == null) {
                    if (other$label != null) {
                        return false;
                    }
                } else if (!this$label.equals(other$label)) {
                    return false;
                }

                Object this$url = this.getUrl();
                Object other$url = other.getUrl();
                if (this$url == null) {
                    if (other$url != null) {
                        return false;
                    }
                } else if (!this$url.equals(other$url)) {
                    return false;
                }

                Object this$icon = this.getIcon();
                Object other$icon = other.getIcon();
                if (this$icon == null) {
                    if (other$icon != null) {
                        return false;
                    }
                } else if (!this$icon.equals(other$icon)) {
                    return false;
                }

                Object this$largeIcon = this.getLargeIcon();
                Object other$largeIcon = other.getLargeIcon();
                if (this$largeIcon == null) {
                    if (other$largeIcon != null) {
                        return false;
                    }
                } else if (!this$largeIcon.equals(other$largeIcon)) {
                    return false;
                }

                if (this.isSelected() != other.isSelected()) {
                    return false;
                } else {
                    return true;
                }
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof MenuItem;
    }

    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        Object $label = this.getLabel();
        result = result * 59 + ($label == null ? 43 : $label.hashCode());
        Object $url = this.getUrl();
        result = result * 59 + ($url == null ? 43 : $url.hashCode());
        Object $icon = this.getIcon();
        result = result * 59 + ($icon == null ? 43 : $icon.hashCode());
        Object $largeIcon = this.getLargeIcon();
        result = result * 59 + ($largeIcon == null ? 43 : $largeIcon.hashCode());
        result = result * 59 + (this.isSelected() ? 79 : 97);
        return result;
    }

    public String toString() {
        return "MenuItem(label=" + this.getLabel() + ", url=" + this.getUrl() + ", icon=" + this.getIcon() + ", largeIcon=" + this.getLargeIcon() + ", selected=" + this.isSelected() + ")";
    }
}